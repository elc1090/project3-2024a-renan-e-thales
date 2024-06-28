import 'package:flutter/material.dart';
import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'item_list_controller.g.dart';

class ItemListController = ItemListControllerBase with _$ItemListController;

abstract class ItemListControllerBase with Store {
  @observable
  List<Item> itemList = ObservableList<Item>.of(globals.items);

  @observable
  TextEditingController warningItemTextController = TextEditingController();

  @observable
  int warningItemThreshold = 20;

  @observable
  TextEditingController dangerItemTextController = TextEditingController();

  @observable
  int dangerItemThreshold = 10;

  @action
  getTileColor(int index, int qtd) {
    Color aux = qtd < dangerItemThreshold
        ? Colors.red[600]!
        : qtd < warningItemThreshold
            ? Colors.yellow[700]!
            : Colors.white;
    return index % 2 == 0
        ? aux
        : aux = aux.withBlue(aux.blue < 15 ? 0 : aux.blue - 15).withGreen(aux.green < 15 ? 0 : aux.green - 15).withRed(aux.red < 15 ? 0 : aux.red - 15);
  }

  @action
  addItem(Item value) {
    if (!itemList.contains(value)) {
      itemList.add(value);
    }
  }

  @action
  setDangerItemThreshold(int value) {
    dangerItemThreshold = value;
  }

  @action
  setWarningItemThreshold(int value) {
    warningItemThreshold = value;
  }

  @action
  switchTab(int index) {
    globals.homeController.tabsController.animateTo(index);
  }
}
