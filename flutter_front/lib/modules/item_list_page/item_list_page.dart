import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_list_tile.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/modules/item_list_page/item_list_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/globals.dart' as globals;

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  ItemListController controller = globals.itemListController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              controller.itemList.isEmpty
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
                              itemCount: controller.itemList.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CustomListTile(controller.itemList[index], tileColor: _getTileColor(index, controller.itemList[index].qtd!)),
                                  const Divider(
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: ElevatedButton.icon(
                                onPressed: () {},
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
    );
  }

  _getTileColor(int index, int qtd) {
    return qtd < controller.dangerItemThreshold
        ? Colors.red[400]
        : qtd < controller.warningItemThreshold
            ? Colors.yellow[400]
            : index % 2 == 0
                ? Colors.white
                : Colors.grey[400];
  }
}
