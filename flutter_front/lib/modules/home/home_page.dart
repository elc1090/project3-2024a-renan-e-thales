import 'dart:math';
import 'dart:developer' as dev;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter_front/core/custom_widgets/custom_delete_prompt.dart';
import 'package:flutter_front/core/custom_widgets/custom_icon_button.dart';
import 'package:flutter_front/core/custom_widgets/custom_list_tile.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/core/helpers/input_formatter.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  DateFormat format = DateFormat("dd-MM-yyyy");
  HomeController controller = globals.homeController;
  final TextEditingController _nomeTextController = TextEditingController();
  final TextEditingController _descTextController = TextEditingController();
  final TextEditingController _qtdTextController = TextEditingController(text: "0");
  final TextEditingController _validadeTextController = TextEditingController();
  late TabController _tabsController;
  List<String> categoriasEscolhidas = [];
  final _formKey = GlobalKey<FormState>();
  int dangerItemThreshold = 10;
  int warningItemThreshold = 20;

  bool _isSearchOpen = false;

  double _defineBreakpoint(double x) {
    if (x > 575) {
      if (x > 1000) {
        return (x * 0.3);
      }
      return (x * 0.5);
    }
    return (x * 0.9);
  }

  @override
  void initState() {
    _tabsController = TabController(length: 2, vsync: this);
    controller.itemList = globals.items;
    controller.categorias = globals.categorias;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.lightBlue,
        bottom: TabBar(controller: _tabsController, indicatorColor: Colors.white, tabs: [
          CustomText(
            "Listagem",
            color: Theme.of(context).colorScheme.onPrimary,
            size: 16,
          ),
          CustomText(
            "Novo Item",
            color: Theme.of(context).colorScheme.onPrimary,
            size: 16,
          )
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isSearchOpen ? 200 : 32,
              child: _isSearchOpen
                  ? TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: IconButton(
                          onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                          icon: const Icon(CarbonIcons.search),
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                      icon: const Icon(CarbonIcons.search),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: TabBarView(
        controller: _tabsController,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 1000 ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, border: Border(bottom: BorderSide(color: Colors.grey[600]!, width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                          child: CustomText(
                            "Item",
                            size: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                          child: CustomText(
                            "Qtd",
                            size: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller.itemList == null
                      ? const Center(
                          child: Text("Vazio"),
                        )
                      : Expanded(
                          child: Observer(builder: (_) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  clipBehavior: Clip.hardEdge,
                                  itemCount: controller.itemList!.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      CustomListTile(controller.itemList![index], tileColor: _getTileColor(index, controller.itemList![index].qtd!)),
                                      const Divider(
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      _tabsController.animateTo(1);
                                    },
                                    icon: const Icon(CarbonIcons.add),
                                    label: CustomText(
                                      "Novo Item",
                                      size: 14,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                ],
              ),
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                width: _defineBreakpoint(constraints.maxWidth),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomText("Adicionar Novo Item"),
                      ),
                      TextFormField(
                        controller: _nomeTextController,
                        validator: (value) {
                          if (value == null || value == '') {
                            return '*Campo obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "nome",
                          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descTextController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "descrição",
                          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => setState(
                                    () {
                                      if (int.parse(_qtdTextController.text) - 10 > 0) {
                                        _qtdTextController.text = "${int.parse(_qtdTextController.text) - 10}";
                                      } else {
                                        _qtdTextController.text = "0";
                                      }
                                    },
                                  ),
                              child: const Text("-10")),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              controller: _qtdTextController,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return '*Campo obrigatório';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "quantidade inicial",
                                labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () => setState(
                                    () => _qtdTextController.text = "${int.parse(_qtdTextController.text) + 10}",
                                  ),
                              child: const Text("+10")),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                                InputFormatter(
                                  sample: "XX/XX/XXXX",
                                  separator: "/",
                                ),
                              ],
                              controller: _validadeTextController,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return '*Campo obrigatório';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: () => _openDatePicker(), icon: const Icon(Icons.date_range_outlined)),
                                labelText: "data de validade",
                                labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        splashFactory: categoriasEscolhidas.isEmpty ? InkRipple.splashFactory : NoSplash.splashFactory,
                        splashColor: categoriasEscolhidas.isEmpty ? Theme.of(context).colorScheme.tertiary.withAlpha(50) : Colors.transparent,
                        highlightColor: categoriasEscolhidas.isEmpty ? null : Colors.transparent,
                        onTap: () => categoriasEscolhidas.isEmpty ? _openCategoriasBottomsheet(context) : null,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: CustomText(
                                      "categorias",
                                      size: 12,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _openCategoriasBottomsheet(context),
                                    icon: const Icon(Icons.add),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                children: [
                                  if (categoriasEscolhidas.isEmpty)
                                    Row(
                                      children: [
                                        CustomText(
                                          "Vazio",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: Colors.grey[900],
                                        ),
                                      ],
                                    ),
                                  for (var categ in categoriasEscolhidas)
                                    Container(
                                      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Theme.of(context).colorScheme.primary),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          CustomText(
                                            categ,
                                            size: 14,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                categoriasEscolhidas.remove(categ);
                                              });
                                            },
                                            splashRadius: 2,
                                            visualDensity: VisualDensity.compact,
                                            icon: const Icon(Icons.close),
                                          )
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                              final newItem = Item(
                                id: controller.itemList!.length + 1,
                                nome: _nomeTextController.text.trim(),
                                description: _descTextController.text.trim(),
                                qtd: int.parse(_qtdTextController.text.trim()),
                                categList: List<String>.from(categoriasEscolhidas),
                              );
                              controller.itemList!.add(newItem);
                              setState(() {
                                _clearInputs();
                              });
                              _tabsController.index = 0;
                            }
                          },
                          icon: const Icon(CarbonIcons.add),
                          label: CustomText(
                            "Adicionar",
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTileColor(int index, int qtd) {
    return qtd < dangerItemThreshold
        ? Colors.red[400]
        : qtd < warningItemThreshold
            ? Colors.yellow[400]
            : index % 2 == 0
                ? Colors.white
                : Colors.grey[400];
  }

  _clearInputs() {
    _nomeTextController.clear();
    _descTextController.clear();
    _qtdTextController.clear();
    _validadeTextController.clear();
    categoriasEscolhidas.clear();
  }

  _openDatePicker() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime(3000),
    );
    if (date != null) {
      _validadeTextController.text = "${date.day}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    }
  }

  _openCategoriasBottomsheet(BuildContext context) async {
    TextEditingController buscarCategController = TextEditingController();
    TextEditingController newCategController = TextEditingController();
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, fn) {
            return Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: TextFormField(
                      controller: buscarCategController,
                      decoration: InputDecoration(
                        labelText: "buscar categoria",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                        ),
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.categorias!.isNotEmpty ? controller.categorias!.length : 1,
                      itemBuilder: (context, index) => Observer(
                        builder: (_) => ListTile(
                          title: controller.categorias!.isNotEmpty
                              ? CustomText(
                                  controller.categorias![index],
                                  size: 16,
                                )
                              : CustomText(
                                  "Nenhuma categoria cadastrada",
                                  size: 16,
                                ),
                          leading: controller.categorias!.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    fn(() {
                                      if (categoriasEscolhidas.contains(controller.categorias![index])) {
                                        setState(() {
                                          categoriasEscolhidas.remove(controller.categorias![index]);
                                        });
                                      } else {
                                        setState(() {
                                          categoriasEscolhidas.add(controller.categorias![index]);
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    categoriasEscolhidas.contains(controller.categorias![index]) ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      controller: newCategController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(CarbonIcons.add),
                            onPressed: () => fn(() {
                                  controller.addCategoria(newCategController.text);
                                  newCategController.clear();
                                })),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                        hintText: "Adicionar uma nova categoria",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey[400]!, width: 2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
