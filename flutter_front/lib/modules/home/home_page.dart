import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/core/helpers/input_formatter.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
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
  HomeController controller = HomeController();
  final TextEditingController _nomeTextController = TextEditingController();
  final TextEditingController _descTextController = TextEditingController();
  final TextEditingController _qtdTextController = TextEditingController(text: "0");
  final TextEditingController _validadeTextController = TextEditingController();
  late TabController _tabsController;
  List<String> categoriasEscolhidas = [];

  bool _isSearchOpen = false;

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
        title: const Text("Itens"),
        bottom: TabBar(controller: _tabsController, tabs: const [Text("Itens"), Text("Novo Item")]),
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
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                      icon: const Icon(Icons.search),
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
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item"),
                        Text("Qtd"),
                      ],
                    ),
                  ),
                  controller.itemList == null
                      ? const Center(
                          child: Text("Vazio"),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            clipBehavior: Clip.hardEdge,
                            itemCount: controller.itemList!.length,
                            itemBuilder: (context, index) => ListTile(
                              minTileHeight: 70,
                              tileColor: Theme.of(context).colorScheme.tertiary,
                              onTap: () {},
                              title: Text(
                                controller.itemList![index].nome,
                                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onTertiary),
                              ),
                              trailing: Text(
                                "${controller.itemList![index].qtd ?? 0}",
                                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onTertiary),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        _tabsController.animateTo(1);
                      },
                      child: CustomText(
                        "+ Novo Item",
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25 - 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomText("Adicionar Novo Item"),
                  ),
                  TextFormField(
                    controller: _nomeTextController,
                    decoration: InputDecoration(
                      labelText: "nome",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
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
                          decoration: InputDecoration(
                            labelText: "quantidade inicial",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
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
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: () => _openDatePicker(), icon: const Icon(Icons.date_range_outlined)),
                            labelText: "data de validade",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
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
                                    "Adicione categorias clicando no botão ",
                                    size: 14,
                                    color: Colors.grey[900],
                                  ),
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 16,
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
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("+ Adicionar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, fn) {
            return Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListView.builder(
                itemCount: controller.categorias!.isNotEmpty ? controller.categorias!.length : 1,
                itemBuilder: (context, index) => ListTile(
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
            );
          });
        });
  }
}
