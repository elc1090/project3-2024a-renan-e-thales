import 'package:flutter_front/models/categoria.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/new_item/categorias_list/categorias_list.dart';
import 'package:mobx/mobx.dart';
import '../../../core/globals.dart' as globals;

part 'categorias_list_controller.g.dart';

class CategoriasListController = CategoriasListControllerBase with _$CategoriasListController;

abstract class CategoriasListControllerBase with Store {
  CategoriasListControllerBase({categorias}) : categorias = categorias ?? [];

  @observable
  Item? item;

  @observable
  List<Categoria> categorias = ObservableList<Categoria>();

  @observable
  List<Categoria> categoriasEscolhidas = ObservableList<Categoria>();

  @observable
  AccessFrom? access;

  @action
  bool addCategoria(String value) {
    for (var cat in categorias) {
      if (cat.nome == value) {
        return false;
      }
    }
    categorias.add(Categoria(id: categorias.length + 1, nome: value));
    return true;
  }

  @action
  selecionarCategoria(int value) {
    for (var cat in categoriasEscolhidas) {
      if (cat.id == value) {
        return false;
      }
    }
    for (var cat in categorias) {
      if (cat.id == value) {
        categoriasEscolhidas.add(cat);
      }
    }
    if (item != null) {
      item!.categList = categoriasEscolhidas.map((c) => c.id).toList();
    }
    switch (access) {
      case AccessFrom.ITEM_MODAL:
        if (item != null) {
          globals.itemListController.itemList[globals.itemListController.itemList.indexWhere((e) => e.id == item!.id)].categList = item!.categList;
        }
        break;
      case AccessFrom.NEW_ITEM_FORM:
        globals.newItemController.categoriasEscolhidas = categoriasEscolhidas.map((c) => c.id).toList();
        break;
      default:
        break;
    }
  }

  @action
  deselecionarCategoria(int value) {
    for (var cat in categorias) {
      if (cat.id == value) {
        categoriasEscolhidas.removeWhere((c) => c.id == value);
      }
    }
    if (item != null) {
      item!.categList = categoriasEscolhidas.map((c) => c.id).toList();
    }
  }
}
