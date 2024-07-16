import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_front/core/widgets/custom_delete_prompt.dart';
import 'package:flutter_front/core/widgets/custom_icon_button.dart';
import 'package:flutter_front/core/widgets/custom_item_modal/custom_item_controller.dart';
import 'package:flutter_front/core/widgets/custom_text.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/categorias_list/categorias_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../globals.dart' as globals;

class CustomItemModal extends StatefulWidget {
  CustomItemModal(this.item, {this.voidCallback, super.key});

  Item item;
  VoidCallback? voidCallback;

  @override
  State<CustomItemModal> createState() => _CustomItemModalState();
}

class _CustomItemModalState extends State<CustomItemModal> {
  late CustomItemController controller;

  TextEditingController qtdController = TextEditingController();

  bool _isEditing = false;
  DateFormat format = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    controller = CustomItemController(widget.item);
    controller.categorias = widget.item.categList;
    controller.nameController.text = widget.item.nome;
    controller.descriptionController.text = widget.item.description ?? "";
    super.initState();
  }

  @override
  void dispose() {
    if (widget.voidCallback != null) {
      widget.voidCallback!.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, st) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: const Color.fromARGB(255, 39, 155, 209),
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 450 ? 450 : MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color.fromARGB(255, 39, 155, 209)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        controller: controller.nameController,
                        readOnly: !_isEditing,
                        cursorColor: Colors.white,
                        style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isEditing ? Colors.white : Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isEditing ? Colors.white : Colors.transparent, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    // CustomIconButton(item.icon),
                    CustomIconButton(
                      const Icon(CarbonIcons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Quantidade em estoque',
                          size: 14,
                          color: Colors.grey,
                        ),
                        CustomText(
                          controller.item.qtd != null ? controller.item.qtd.toString() : '0',
                          size: 14,
                          color: controller.item.description != null && controller.item.description!.isNotEmpty ? Colors.grey[900] : Colors.grey,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Peso por unidade',
                          size: 14,
                          color: Colors.grey,
                        ),
                        CustomText(
                          '${controller.item.peso.toString().replaceAll('.', ',')} ${controller.item.medida}',
                          size: 14,
                          color: controller.item.description != null && controller.item.description!.isNotEmpty ? Colors.grey[900] : Colors.grey,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Validade',
                          size: 14,
                          color: Colors.grey,
                        ),
                        CustomText(
                          controller.item.perecivel ? "${format.parse(widget.item.dataVal!)}" : "Item não perecível",
                          size: 14,
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          'Descrição',
                          size: 14,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: controller.descriptionController,
                              minLines: 1,
                              maxLines: 5,
                              readOnly: !_isEditing,
                              enabled: _isEditing,
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.grey[900], fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Sem descrição",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Categorias',
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Observer(
                                builder: (_) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.item.categList.isEmpty)
                                      CustomText(
                                        "Sem categorias",
                                        size: 14,
                                        color: Colors.grey[400],
                                      ),
                                    if (controller.item.categList.isNotEmpty)
                                      for (var categ in controller.item.categList)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              CarbonIcons.caret_right,
                                              color: Colors.grey[400],
                                            ),
                                            CustomText(
                                              globals.categorias.firstWhere((c) => c.id == categ).nome,
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        if (_isEditing)
                          TextButton.icon(
                            label: CustomText(
                              "Editar",
                              size: 14,
                            ),
                            icon: Icon(
                              CarbonIcons.tag_edit,
                              size: 22,
                              color: Colors.grey[900]!,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                builder: (context) {
                                  return CategoriasList(
                                    item: controller.item,
                                    access: AccessFrom.ITEM_MODAL,
                                  );
                                },
                              ).then((value) => st(() {}));
                            },
                          ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Color.fromARGB(255, 39, 155, 209)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconButton(
                      const Icon(CarbonIcons.settings_adjust),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        enableDrag: true,
                        builder: (context) => _getAdjustQuantitiesBottomSheet(controller.item),
                      ).then(
                        (value) {
                          setState(() {
                            controller.updateQtd(int.parse(qtdController.text));
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomIconButton(
                      const Icon(CarbonIcons.delete),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        enableDrag: true,
                        builder: (context) => _getDeleteModal(context, controller.item),
                      ).then((value) => setState(() {})),
                    ),
                    const SizedBox(width: 8),
                    CustomIconButton(
                      _isEditing ? const Icon(CarbonIcons.edit_off) : const Icon(CarbonIcons.edit),
                      color: _isEditing ? Colors.red[600] : null,
                      onPressed: () => st(() {
                        _isEditing = !_isEditing;
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _getDeleteModal(BuildContext context, Item item) {
    return CustomDeletePrompt(
      "Excluír item?",
      onPressed: () {
        controller.deleteItem(item.id);
        controller.removeGlobalItem(item);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }

  _getAdjustQuantitiesBottomSheet(Item item) {
    item.qtd ??= 0;
    qtdController.text = item.qtd.toString();
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width > 450 ? 450 : MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText("Quantidade atual:", size: 14),
              const SizedBox(
                width: 16,
              ),
              CustomText(item.qtd.toString(), size: 14),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              CustomText("Nova quantidade:", size: 14),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: qtdController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
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
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
