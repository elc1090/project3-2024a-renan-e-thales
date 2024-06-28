import 'package:flutter/material.dart';
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
  List<String> categoriasEscolhidas = ObservableList<String>();

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
  selecionarCategoria(String value) {
    if (!categoriasEscolhidas.contains(value)) {
      categoriasEscolhidas.add(value);
    }
  }

  @action
  deselecionarCategoria(String value) {
    if (categoriasEscolhidas.contains(value)) {
      categoriasEscolhidas.remove(value);
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
  }
}
