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
  List<int> categorias = ObservableList<int>();

  @action
  updateCategorias(List<int> categs) {
    item.categList = categs;
  }

  @action
  Future<void> updateQtd(int qtd) async {
    item.qtd = qtd;
    globals.itemsMocado.where((element) => element.id == item.id).first.qtd = qtd;
  }

  @action
  Future<void> deleteItem(String id) async {
    globals.itemsMocado.removeWhere((element) => element.id == id);
  }

  @action
  updateGlobalItem(Item item) {
    globals.items[globals.items.indexWhere((e) => e.id == item.id)] = item;
  }

  @action
  removeGlobalItem(Item item) {
    globals.items.removeWhere((e) => e.id == item.id);
  }
}
