import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  List<Item>? itemList = ObservableList<Item>();

  @observable
  List<String>? categorias;

  @action
  Future<void> getItems() async => itemList = [];

  @action
  Future<void> getCategorias() async => categorias = [];

  @action
  Future<void> deletItem(int id) async {
    itemList?.removeWhere((element) => element.id == id);
  }
}
