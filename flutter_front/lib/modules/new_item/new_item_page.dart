import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_front/core/helpers/input_formatter.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/categorias_list/categorias_list.dart';
import 'package:flutter_front/modules/new_item/new_item_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../../core/globals.dart' as globals;

import '../../core/widgets/custom_text.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({super.key});

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  NewItemController controller = globals.newItemController;

  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Center(
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
                      controller: controller.nomeTextController,
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
                      controller: controller.descTextController,
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
                            onPressed: () {
                              if (int.parse(controller.qtdTextController.text) - 10 > 0) {
                                controller.qtdTextController.text = "${int.parse(controller.qtdTextController.text) - 10}";
                              } else {
                                controller.qtdTextController.text = "0";
                              }
                            },
                            child: const Text("-10")),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            controller: controller.qtdTextController,
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
                            onPressed: () => controller.qtdTextController.text = "${int.parse(controller.qtdTextController.text) + 10}",
                            child: const Text("+10")),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.pesoTextController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d*')),
                            ],
                            validator: (value) {
                              if (value == null || value == '') {
                                return '*Campo obrigatório';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "peso por unidade",
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
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: controller.medidaTextController,
                            inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(3)],
                            validator: (value) {
                              if (value == null || value == '') {
                                return '*Campo obrigatório';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "medida",
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
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            controller.isPerecivel = !controller.isPerecivel;
                            if (controller.isPerecivel) {
                              controller.validadeTextController.text = controller.dateAux!;
                              controller.dateAux = '';
                            } else {
                              controller.dateAux = controller.validadeTextController.text;
                              controller.validadeTextController.text = '';
                            }
                          },
                          child: Row(
                            children: [
                              Observer(
                                builder: (_) => IconButton(
                                  icon: Icon(
                                    !controller.isPerecivel ? CarbonIcons.checkbox : CarbonIcons.checkbox_checked_filled,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    controller.isPerecivel = !controller.isPerecivel;
                                    if (controller.isPerecivel) {
                                      controller.validadeTextController.text = controller.dateAux!;
                                      controller.dateAux = '';
                                    } else {
                                      controller.dateAux = controller.validadeTextController.text;
                                      controller.validadeTextController.text = '';
                                    }
                                  },
                                ),
                              ),
                              CustomText(
                                "Perecível?",
                                size: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Observer(
                            builder: (_) => TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                                InputFormatter(
                                  sample: "XX/XX/XXXX",
                                  separator: "/",
                                ),
                              ],
                              enabled: controller.isPerecivel,
                              controller: controller.validadeTextController,
                              validator: (value) {
                                if (controller.isPerecivel && (value == null || value == '')) {
                                  return '*Campo obrigatório';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => _openDatePicker(),
                                  icon: Icon(
                                    Icons.date_range_outlined,
                                    color: controller.isPerecivel ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                                  ),
                                ),
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
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
                                ),
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
                      splashFactory: controller.categoriasEscolhidas.isEmpty ? InkRipple.splashFactory : NoSplash.splashFactory,
                      splashColor: controller.categoriasEscolhidas.isEmpty ? Theme.of(context).colorScheme.tertiary.withAlpha(50) : Colors.transparent,
                      highlightColor: controller.categoriasEscolhidas.isEmpty ? null : Colors.transparent,
                      onTap: () => controller.categoriasEscolhidas.isEmpty ? _openCategoriasBottomsheet(context) : null,
                      enableFeedback: controller.categoriasEscolhidas.isEmpty,
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
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  visualDensity: VisualDensity.compact,
                                ),
                              ],
                            ),
                            Observer(
                              builder: (_) => controller.categoriasEscolhidas.isEmpty
                                  ? Row(
                                      children: [
                                        CustomText(
                                          "Vazio",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: Colors.grey[900],
                                        ),
                                      ],
                                    )
                                  : Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runAlignment: WrapAlignment.start,
                                      children: [
                                        for (var categ in controller.categoriasEscolhidas)
                                          Container(
                                            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                                            margin: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Theme.of(context).colorScheme.primary),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                CustomText(
                                                  globals.categorias.firstWhere((c) => c.id == categ).nome,
                                                  size: 14,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      controller.deselecionarCategoria(categ);
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
                            final newItem = Item(
                              id: const Uuid().v4(),
                              estoqueId: '1',
                              nome: controller.nomeTextController.text.trim(),
                              description: controller.descTextController.text.trim(),
                              qtd: int.parse(controller.qtdTextController.text.trim()),
                              perecivel: controller.isPerecivel,
                              dataVal: controller.isPerecivel ? controller.validadeTextController.text : null,
                              peso: double.parse(controller.pesoTextController.text.trim().replaceAll(',', '.')),
                              medida: controller.medidaTextController.text.trim(),
                              categList: List<int>.from(controller.categoriasEscolhidas),
                            );
                            controller.newItem = newItem;
                            globals.itemListController.addItem(controller.newItem!);
                            controller.newItem = null;
                            globals.toastController.show(
                              context,
                              "Item criado com sucesso!",
                              Colors.green,
                              CarbonIcons.checkmark_filled,
                              const Duration(seconds: 3),
                            );
                            controller.clearInputs();
                            controller.switchTab(0);
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
      controller.validadeTextController.text = "${date.day}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    }
  }

  _openCategoriasBottomsheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return CategoriasList(
          access: AccessFrom.NEW_ITEM_FORM,
        );
      },
    );
  }
}
