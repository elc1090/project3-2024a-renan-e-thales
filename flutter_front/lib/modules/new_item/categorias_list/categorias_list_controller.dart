import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/categorias_list/categorias_list.dart';
import 'package:mobx/mobx.dart';
import '../../../core/globals.dart' as globals;

part 'categorias_list_controller.g.dart';

class CategoriasListController = CategoriasListControllerBase with _$CategoriasListController;

abstract class CategoriasListControllerBase with Store {
  CategoriasListControllerBase({categorias}) : categorias = categorias ?? [];

  @observable
  late Item item;

  @observable
  List<String> categorias = ObservableList<String>();

  @observable
  List<String> categoriasEscolhidas = ObservableList<String>();

  @observable
  AccessFrom? access;

  @action
  addCategoria(String value) {
    if (!categorias.contains(value)) {
      categorias.add(value);
    }
  }

  @action
  selecionarCategoria(String value) {
    if (!categoriasEscolhidas.contains(value)) {
      categoriasEscolhidas.add(value);
    }
    switch (access) {
      case AccessFrom.ITEM_MODAL:
        globals.itemListController.itemList[globals.itemListController.itemList.indexWhere((e) => e.id == item.id)].categList = item.categList;
        break;
      case AccessFrom.NEW_ITEM_FORM:
        globals.newItemController.categoriasEscolhidas = categoriasEscolhidas;
        break;
      default:
        break;
    }
  }

  @action
  deselecionarCategoria(String value) {
    if (categoriasEscolhidas.contains(value)) {
      categoriasEscolhidas.remove(value);
    }
  }
}
