// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriasListController on CategoriasListControllerBase, Store {
  late final _$itemAtom =
      Atom(name: 'CategoriasListControllerBase.item', context: context);

  @override
  Item? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Item? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$categoriasAtom =
      Atom(name: 'CategoriasListControllerBase.categorias', context: context);

  @override
  List<Categoria> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<Categoria> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  late final _$categoriasEscolhidasAtom = Atom(
      name: 'CategoriasListControllerBase.categoriasEscolhidas',
      context: context);

  @override
  List<Categoria> get categoriasEscolhidas {
    _$categoriasEscolhidasAtom.reportRead();
    return super.categoriasEscolhidas;
  }

  @override
  set categoriasEscolhidas(List<Categoria> value) {
    _$categoriasEscolhidasAtom.reportWrite(value, super.categoriasEscolhidas,
        () {
      super.categoriasEscolhidas = value;
    });
  }

  late final _$accessAtom =
      Atom(name: 'CategoriasListControllerBase.access', context: context);

  @override
  AccessFrom? get access {
    _$accessAtom.reportRead();
    return super.access;
  }

  @override
  set access(AccessFrom? value) {
    _$accessAtom.reportWrite(value, super.access, () {
      super.access = value;
    });
  }

  late final _$CategoriasListControllerBaseActionController =
      ActionController(name: 'CategoriasListControllerBase', context: context);

  @override
  bool addCategoria(String value) {
    final _$actionInfo = _$CategoriasListControllerBaseActionController
        .startAction(name: 'CategoriasListControllerBase.addCategoria');
    try {
      return super.addCategoria(value);
    } finally {
      _$CategoriasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarCategoria(int value) {
    final _$actionInfo = _$CategoriasListControllerBaseActionController
        .startAction(name: 'CategoriasListControllerBase.selecionarCategoria');
    try {
      return super.selecionarCategoria(value);
    } finally {
      _$CategoriasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deselecionarCategoria(int value) {
    final _$actionInfo =
        _$CategoriasListControllerBaseActionController.startAction(
            name: 'CategoriasListControllerBase.deselecionarCategoria');
    try {
      return super.deselecionarCategoria(value);
    } finally {
      _$CategoriasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
item: ${item},
categorias: ${categorias},
categoriasEscolhidas: ${categoriasEscolhidas},
access: ${access}
    ''';
  }
}
