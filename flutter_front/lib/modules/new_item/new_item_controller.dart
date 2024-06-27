import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'new_item_controller.g.dart';

class NewItemController = NewItemControllerBase with _$NewItemController;

abstract class NewItemControllerBase with Store {
  @observable
  Item? newItem;

  @action
  getItemListLength() {
    return globals.items.length;
  }

  @action
  getItemList() {
    return globals.items;
  }

  @action
  getCategoriasListLength() {
    return globals.categorias.length;
  }

  @action
  getCategoriasList() {
    return globals.categorias;
  }

  @action
  addCategoria(String value) {
    if (!globals.categorias.contains(value)) {
      globals.categorias.add(value);
    }
  }

  @action
  switchIndex(int index) {}
}
