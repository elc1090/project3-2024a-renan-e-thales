import 'package:flutter/material.dart';
import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  List<Item>? itemList = ObservableList<Item>();

  @observable
  List<String>? categorias = ObservableList<String>();

  @observable
  late TabController tabsController;

  @action
  Future<void> addCategoria(String categoria) async {
    categorias ??= <String>[];
    categorias!.add(categoria);
  }
}
