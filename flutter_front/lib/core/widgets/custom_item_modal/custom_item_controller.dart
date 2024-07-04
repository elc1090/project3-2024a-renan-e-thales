import 'package:flutter/material.dart';
import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../globals.dart' as globals;

part 'custom_item_controller.g.dart';

class CustomItemController = CustomItemControllerBase with _$CustomItemController;

abstract class CustomItemControllerBase with Store {
  CustomItemControllerBase(this.item);

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  Item item;

  @observable
  List<String> categorias = ObservableList<String>();

  @action
  addItemCategoria(String value) {
    if (!categorias.contains(value)) {
      categorias.add(value);
    }
  }

  @action
  removeItemCategoria(String value) {
    if (categorias.contains(value)) {
      categorias.remove(value);
    }
  }

  @action
  Future<void> updateQtd(int qtd) async {
    item.qtd = qtd;
  }

  @action
  Future<void> deleteItem(int id) async {
    globals.items.removeWhere((element) => element.id == id);
  }

  @action
  updateGlobalItem(Item item) {
    globals.items[globals.items.indexWhere((e) => e.id == item.id)] = item;
  }

  @action
  removeGlobalItem(Item item) {
    globals.itemListController.itemList.removeAt(globals.items.indexWhere((e) => e.id == item.id));
    globals.items.removeAt(globals.items.indexWhere((e) => e.id == item.id));
  }
}
