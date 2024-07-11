import 'dart:developer';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  @observable
  bool hidePassword = false;

  @observable
  bool hideConfirmPassword = false;

  @action
  Future<bool> register(String name, String email, String password) async {
    try {
      final res = await globals.dataManager.postUser(name, email, password);
      return res != null
          ? (res.statusCode == 200 || res.statusCode == 201)
              ? true
              : false
          : false;
    } catch (e) {
      log(e.toString());
      return Future.value(false);
    }
  }
}
