import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_front/core/helpers/input_formatter.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/new_item_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;

import '../../core/custom_widgets/custom_text.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({super.key});

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  NewItemController controller = globals.newItemController;
  final TextEditingController _nomeTextController = TextEditingController();
  final TextEditingController _descTextController = TextEditingController();
  final TextEditingController _qtdTextController = TextEditingController(text: "0");
  final TextEditingController _validadeTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> categoriasEscolhidas = [];

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                            id: controller.getItemListLength() + 1,
                            nome: _nomeTextController.text.trim(),
                            description: _descTextController.text.trim(),
                            qtd: int.parse(_qtdTextController.text.trim()),
                            categList: List<String>.from(categoriasEscolhidas),
                          );
                          controller.newItem = newItem;
                          setState(() {
                            _clearInputs();
                          });
                          controller.switchIndex(0);
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
    );
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
        return StatefulBuilder(
          builder: (context, setInnerState) {
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
                      itemCount: (controller.getCategoriasListLength() > 0) ? controller.getCategoriasListLength() : 1,
                      itemBuilder: (context, index) => Observer(
                        builder: (_) => ListTile(
                          title: controller.getCategoriasListLength() > 0
                              ? CustomText(
                                  controller.getCategoriasList()![index],
                                  size: 16,
                                )
                              : CustomText(
                                  "Nenhuma categoria cadastrada",
                                  size: 16,
                                ),
                          leading: controller.getCategoriasList()!.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setInnerState(() {
                                      if (categoriasEscolhidas.contains(controller.getCategoriasList()![index])) {
                                        setState(() {
                                          categoriasEscolhidas.remove(controller.getCategoriasList()![index]);
                                        });
                                      } else {
                                        setState(() {
                                          categoriasEscolhidas.add(controller.getCategoriasList()![index]);
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    categoriasEscolhidas.contains(controller.getCategoriasList()![index]) ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: newCategController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(CarbonIcons.add),
                          onPressed: () => setInnerState(() {
                            controller.addCategoria(newCategController.text);
                            newCategController.clear();
                          }),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
          },
        );
      },
    );
  }
}
