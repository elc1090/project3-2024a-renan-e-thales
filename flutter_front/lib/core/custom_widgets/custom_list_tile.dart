import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_delete_prompt.dart';
import 'package:flutter_front/core/custom_widgets/custom_icon_button.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart' as globals;

class CustomListTile extends StatefulWidget {
  CustomListTile(this.item, {this.tileColor, super.key});

  Item item;
  Color? tileColor;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  HomeController controller = globals.homeController;
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        widget.item.nome,
        size: 16,
      ),
      trailing: CustomText(widget.item.qtd != null ? widget.item.qtd.toString() : "0"),
      tileColor: widget.tileColor ?? Colors.white,
      onTap: () => _openItemModal(context, widget.item),
    );
  }

  _openItemModal(BuildContext context, Item item) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    nameController.text = item.nome;
    descriptionController.text = item.description ?? "";
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, st) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Container(
                  width: MediaQuery.of(context).size.width > 450 ? 450 : MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).colorScheme.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextFormField(
                                minLines: 1,
                                maxLines: 3,
                                controller: nameController,
                                readOnly: !_isEditing,
                                cursorColor: Colors.white,
                                style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600),
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
                            CustomIconButton(item.icon),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Descrição',
                                  size: 14,
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
                                      controller: descriptionController,
                                      minLines: 1,
                                      maxLines: 5,
                                      readOnly: !_isEditing,
                                      decoration: InputDecoration(
                                        hintText: "Sem descrição",
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
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  'Quantidade',
                                  size: 14,
                                ),
                                CustomText(
                                  item.qtd != null ? item.qtd.toString() : '0',
                                  size: 14,
                                  color: item.description != null && item.description!.isNotEmpty ? Colors.grey[900] : Colors.grey[500],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Categorias',
                                  size: 14,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (item.categList == null || item.categList!.isEmpty)
                                      CustomText(
                                        "Sem categorias",
                                        size: 14,
                                        color: Colors.grey[400],
                                      ),
                                    if (item.categList != null && item.categList!.isNotEmpty)
                                      for (var categ in item.categList!)
                                        CustomText(
                                          categ,
                                          size: 14,
                                        ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            color: Theme.of(context).colorScheme.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomIconButton(
                              const Icon(CarbonIcons.settings_adjust),
                              onPressed: () => showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                enableDrag: true,
                                builder: (context) => _getAdjustQuantitiesBottomSheet(item),
                              ),
                            ),
                            CustomIconButton(
                              const Icon(CarbonIcons.delete),
                              onPressed: () => showDialog(context: context, builder: (context) => _getDeleteModal(context, item)),
                            ),
                            CustomIconButton(
                              _isEditing ? const Icon(CarbonIcons.close) : const Icon(CarbonIcons.edit),
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
            }));
  }

  Widget _getDeleteModal(BuildContext context, Item item) {
    return CustomDeletePrompt(
      "Delete item?",
      onPressed: () => controller.deletItem(item.id),
    );
  }

  _getAdjustQuantitiesBottomSheet(Item item) {
    TextEditingController qtdController = TextEditingController();
    item.qtd ??= 0;
    qtdController.text = item.qtd.toString();
    return Container(
      padding: EdgeInsets.all(16),
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
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: CustomText(
                    "cancelar",
                    size: 12,
                    color: Colors.grey[800],
                  )),
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    "ok",
                    size: 12,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
