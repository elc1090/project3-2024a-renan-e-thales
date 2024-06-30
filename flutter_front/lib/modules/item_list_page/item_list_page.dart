import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_list_tile.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/modules/item_list_page/item_list_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  ItemListController controller = globals.itemListController;

  @override
  void initState() {
    // globals.dataManager.getItemList();
    globals.dataManager.getItemById("arroz");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 1000 ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) => _getAdjustmentsBottomsheet(),
                      ),
                      label: CustomText(
                        'Editar limites',
                        size: 12,
                      ),
                      icon: const Icon(
                        CarbonIcons.settings_adjust,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
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
              controller.itemList.isEmpty
                  ? const Center(
                      child: Text("Vazio"),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) => ListView.builder(
                              shrinkWrap: true,
                              clipBehavior: Clip.hardEdge,
                              itemCount: controller.itemList.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CustomListTile(
                                    controller.itemList[index],
                                    tileColor: _getTileColor(index),
                                  ),
                                  const Divider(
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                controller.switchTab(1);
                              },
                              icon: const Icon(CarbonIcons.add),
                              label: CustomText(
                                "Novo Item",
                                size: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _getAdjustmentsBottomsheet() {
    controller.warningItemTextController.text = controller.warningItemThreshold.toString();
    controller.dangerItemTextController.text = controller.dangerItemThreshold.toString();
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            'Editar limites',
            size: 16,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(text: 'Limite para aviso de estoque ', style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600), children: <TextSpan>[
                    TextSpan(
                      text: 'baixo',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, color: Colors.yellow[800]),
                    ),
                    const TextSpan(
                      text: ':',
                    )
                  ]),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: TextFormField(
                  controller: controller.warningItemTextController,
                  decoration: InputDecoration(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(text: 'Limite para aviso de estoque ', style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600), children: <TextSpan>[
                    TextSpan(
                      text: 'muito baixo',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, color: Colors.red[700]),
                    ),
                    const TextSpan(
                      text: ':',
                    )
                  ]),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: TextFormField(
                  controller: controller.dangerItemTextController,
                  decoration: InputDecoration(
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
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    controller.setWarningItemThreshold(int.parse(controller.warningItemTextController.text));
                    controller.setDangerItemThreshold(int.parse(controller.dangerItemTextController.text));
                    Navigator.of(context).pop();
                  },
                  child: CustomText(
                    'ok',
                    size: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getTileColor(int index) {
    Color aux = controller.itemList[index].qtd! < controller.dangerItemThreshold
        ? Colors.red[600]!
        : controller.itemList[index].qtd! < controller.warningItemThreshold
            ? Colors.yellow[700]!
            : Colors.white;
    return index % 2 == 0
        ? aux
        : aux = aux.withBlue(aux.blue < 15 ? 0 : aux.blue - 15).withGreen(aux.green < 15 ? 0 : aux.green - 15).withRed(aux.red < 15 ? 0 : aux.red - 15);
  }
}
