// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$logadoComputed;

  @override
  bool get logado => (_$logadoComputed ??= Computed<bool>(() => super.logado,
          name: 'LoginControllerBase.logado'))
      .value;

  late final _$userAtom =
      Atom(name: 'LoginControllerBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'LoginControllerBase.loading', context: context);

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
      Atom(name: 'LoginControllerBase.hidePassword', context: context);

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

  late final _$getLocalUserAsyncAction =
      AsyncAction('LoginControllerBase.getLocalUser', context: context);

  @override
  Future<bool> getLocalUser() {
    return _$getLocalUserAsyncAction.run(() => super.getLocalUser());
  }

  late final _$attemptLoginAsyncAction =
      AsyncAction('LoginControllerBase.attemptLogin', context: context);

  @override
  Future<User?> attemptLogin(String email, String password) {
    return _$attemptLoginAsyncAction
        .run(() => super.attemptLogin(email, password));
  }

  @override
  String toString() {
    return '''
user: ${user},
loading: ${loading},
hidePassword: ${hidePassword},
logado: ${logado}
    ''';
  }
}
