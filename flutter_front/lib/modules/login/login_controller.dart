import 'package:flutter_front/models/user.dart';
import 'package:mobx/mobx.dart';
import '../../core/globals.dart' as globals;

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  User? user;

  @computed
  bool get logado => user != null;

  @observable
  bool loading = false;

  @observable
  bool hidePassword = false;

  @action
  Future<User?> attemptLogin(String email, String password) async {
    final User? user = await globals.dataManager.getUser(email, password);
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }
}
