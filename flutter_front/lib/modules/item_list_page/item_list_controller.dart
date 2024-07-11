import 'package:flutter/material.dart';
import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'item_list_controller.g.dart';

class ItemListController = ItemListControllerBase with _$ItemListController;

abstract class ItemListControllerBase with Store {
  @observable
  List<Item> itemList = globals.itemsMocado.asObservable();

  @observable
  TextEditingController warningItemTextController = TextEditingController();

  @observable
  int warningItemThreshold = 20;

  @observable
  TextEditingController dangerItemTextController = TextEditingController();

  @observable
  int dangerItemThreshold = 10;

  @observable
  bool loading = false;

  @action
  addItem(Item value) {
    if (!itemList.contains(value)) {
      itemList.add(value);
    }
  }

  @action
  removeItem(Item value) {
    if (itemList.contains(value)) {
      itemList.remove(value);
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
