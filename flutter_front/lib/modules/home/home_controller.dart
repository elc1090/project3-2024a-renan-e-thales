import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  List<Item>? itemList;

  @action
  Future<void> getItems() async => itemList = [];
}
