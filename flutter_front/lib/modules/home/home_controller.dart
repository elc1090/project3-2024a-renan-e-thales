import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  late TabController tabsController;

  @action
  logout() {
    globals.user = null;
    globals.dataManager.purgeUser();
  }
}
