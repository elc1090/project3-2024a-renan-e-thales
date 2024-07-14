// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'RegisterControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$hidePasswordAtom =
      Atom(name: 'RegisterControllerBase.hidePassword', context: context);

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  late final _$hideConfirmPasswordAtom = Atom(
      name: 'RegisterControllerBase.hideConfirmPassword', context: context);

  @override
  bool get hideConfirmPassword {
    _$hideConfirmPasswordAtom.reportRead();
    return super.hideConfirmPassword;
  }

  @override
  set hideConfirmPassword(bool value) {
    _$hideConfirmPasswordAtom.reportWrite(value, super.hideConfirmPassword, () {
      super.hideConfirmPassword = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('RegisterControllerBase.register', context: context);

  @override
  Future<bool> register(String name, String email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(name, email, password));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
hidePassword: ${hidePassword},
hideConfirmPassword: ${hideConfirmPassword}
    ''';
  }
}
