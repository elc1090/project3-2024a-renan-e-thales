import 'package:flutter_front/models/item.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'item_list_controller.g.dart';

class ItemListController = ItemListControllerBase with _$ItemListController;

abstract class ItemListControllerBase with Store {
  @observable
  List<Item> itemList = ObservableList<Item>.of(globals.items);

  @observable
  int dangerItemThreshold = 10;

  @observable
  int warningItemThreshold = 20;

  @action
  addItem(Item value) {
    if (!itemList.contains(value)) {
      itemList.add(value);
    }
  }

  @action
  setDangerItemThreshold(int value) {
    dangerItemThreshold = value;
  }

  @action
  setWarningItemThreshold(int value) {
    warningItemThreshold = value;
  }
}
