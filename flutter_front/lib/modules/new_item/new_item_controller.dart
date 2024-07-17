import 'package:flutter/material.dart';
import 'package:flutter_front/models/categoria.dart';
import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'new_item_controller.g.dart';

class NewItemController = NewItemControllerBase with _$NewItemController;

abstract class NewItemControllerBase with Store {
  @observable
  TextEditingController nomeTextController = TextEditingController();

  @observable
  TextEditingController descTextController = TextEditingController();

  @observable
  TextEditingController pesoTextController = TextEditingController();

  @observable
  TextEditingController medidaTextController = TextEditingController();

  @observable
  TextEditingController qtdTextController = TextEditingController(text: "0");

  @observable
  TextEditingController validadeTextController = TextEditingController();

  @observable
  String? dateAux;

  @observable
  Item? newItem;

  @observable
  bool isPerecivel = true;

  @observable
  List<int> categoriasEscolhidas = ObservableList<int>.of([]);

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
  bool addCategoria(String value) {
    for (var cat in globals.categorias) {
      if (cat.nome == value) {
        return false;
      }
    }
    globals.categorias.add(Categoria(id: globals.categorias.length + 1, nome: value));
    return true;
  }

  @action
  selecionarCategoria(int id) {
    for (var cat in globals.categorias) {
      if (globals.categorias.map((c) => c.nome).contains(cat.nome)) {
        if (!categoriasEscolhidas.contains(id)) {
          categoriasEscolhidas.add(id);
        }
      }
    }
  }

  @action
  deselecionarCategoria(int id) {
    for (var cat in globals.categorias) {
      if (globals.categorias.map((c) => c.nome).contains(cat.nome)) {
        if (categoriasEscolhidas.contains(id)) {
          categoriasEscolhidas.removeAt(categoriasEscolhidas.indexOf(id));
        }
      }
    }
  }

  @action
  switchTab(int index) {
    globals.homeController.tabsController.animateTo(index);
  }

  @action
  clearInputs() {
    nomeTextController.clear();
    descTextController.clear();
    qtdTextController.clear();
    qtdTextController.text = "0";
    validadeTextController.clear();
    categoriasEscolhidas.clear();
    pesoTextController.clear();
    medidaTextController.clear();
  }
}
