import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/categorias_list/categorias_list_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/globals.dart' as globals;

enum AccessFrom { ITEM_MODAL, NEW_ITEM_FORM }

class CategoriasList extends StatefulWidget {
  CategoriasList(this.categorias, {this.item, required this.access, super.key});

  List<String> categorias;
  Item? item;
  AccessFrom access;

  @override
  State<CategoriasList> createState() => _CategoriasListState();
}

class _CategoriasListState extends State<CategoriasList> {
  CategoriasListController controller = globals.categoriasListController;

  TextEditingController buscarCategController = TextEditingController();
  TextEditingController newCategController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      controller.item = widget.item!;
      controller.categoriasEscolhidas = widget.item!.categList ?? [];
    } else {
      controller.categoriasEscolhidas = widget.categorias;
    }
    controller.access = widget.access;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setInnerState) {
        return Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "Editar Categorias",
                      size: 18,
                    ),
                    const Icon(
                      CarbonIcons.tag_edit,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: buscarCategController,
                  decoration: InputDecoration(
                    labelText: "buscar categoria",
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                    ),
                    suffixIcon: const Icon(CarbonIcons.search, color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.categorias.isNotEmpty ? controller.categorias.length : 1,
                  itemBuilder: (context, index) => Observer(
                    builder: (_) => ListTile(
                      title: controller.categorias.isEmpty
                          ? CustomText(
                              "Nenhuma categoria cadastrada",
                              size: 16,
                            )
                          : GestureDetector(
                              onTap: () {
                                setInnerState(() {
                                  if (controller.categoriasEscolhidas.contains(controller.categorias[index])) {
                                    controller.deselecionarCategoria(controller.categorias[index]);
                                  } else {
                                    controller.selecionarCategoria(controller.categorias[index]);
                                  }
                                });
                              },
                              child: CustomText(
                                controller.categorias[index],
                                size: 16,
                              ),
                            ),
                      leading: controller.categorias.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setInnerState(() {
                                  if (controller.categoriasEscolhidas.contains(controller.categorias[index])) {
                                    controller.deselecionarCategoria(controller.categorias[index]);
                                  } else {
                                    controller.selecionarCategoria(controller.categorias[index]);
                                  }
                                });
                              },
                              icon: Icon(
                                controller.categoriasEscolhidas.contains(controller.categorias[index]) ? Icons.check_box : Icons.check_box_outline_blank,
                                color: Theme.of(context).colorScheme.primary,
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
                      icon: Icon(
                        CarbonIcons.add,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => setInnerState(() {
                        if (newCategController.text.trim() != '') {
                          controller.addCategoria(newCategController.text);
                          newCategController.clear();
                        }
                      }),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                    hintText: "Adicionar uma nova categoria",
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
              )
            ],
          ),
        );
      },
    );
  }
}
