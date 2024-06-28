// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewItemController on NewItemControllerBase, Store {
  late final _$nomeTextControllerAtom =
      Atom(name: 'NewItemControllerBase.nomeTextController', context: context);

  @override
  TextEditingController get nomeTextController {
    _$nomeTextControllerAtom.reportRead();
    return super.nomeTextController;
  }

  @override
  set nomeTextController(TextEditingController value) {
    _$nomeTextControllerAtom.reportWrite(value, super.nomeTextController, () {
      super.nomeTextController = value;
    });
  }

  late final _$descTextControllerAtom =
      Atom(name: 'NewItemControllerBase.descTextController', context: context);

  @override
  TextEditingController get descTextController {
    _$descTextControllerAtom.reportRead();
    return super.descTextController;
  }

  @override
  set descTextController(TextEditingController value) {
    _$descTextControllerAtom.reportWrite(value, super.descTextController, () {
      super.descTextController = value;
    });
  }

  late final _$qtdTextControllerAtom =
      Atom(name: 'NewItemControllerBase.qtdTextController', context: context);

  @override
  TextEditingController get qtdTextController {
    _$qtdTextControllerAtom.reportRead();
    return super.qtdTextController;
  }

  @override
  set qtdTextController(TextEditingController value) {
    _$qtdTextControllerAtom.reportWrite(value, super.qtdTextController, () {
      super.qtdTextController = value;
    });
  }

  late final _$validadeTextControllerAtom = Atom(
      name: 'NewItemControllerBase.validadeTextController', context: context);

  @override
  TextEditingController get validadeTextController {
    _$validadeTextControllerAtom.reportRead();
    return super.validadeTextController;
  }

  @override
  set validadeTextController(TextEditingController value) {
    _$validadeTextControllerAtom
        .reportWrite(value, super.validadeTextController, () {
      super.validadeTextController = value;
    });
  }

  late final _$dateAuxAtom =
      Atom(name: 'NewItemControllerBase.dateAux', context: context);

  @override
  String? get dateAux {
    _$dateAuxAtom.reportRead();
    return super.dateAux;
  }

  @override
  set dateAux(String? value) {
    _$dateAuxAtom.reportWrite(value, super.dateAux, () {
      super.dateAux = value;
    });
  }

  late final _$newItemAtom =
      Atom(name: 'NewItemControllerBase.newItem', context: context);

  @override
  Item? get newItem {
    _$newItemAtom.reportRead();
    return super.newItem;
  }

  @override
  set newItem(Item? value) {
    _$newItemAtom.reportWrite(value, super.newItem, () {
      super.newItem = value;
    });
  }

  late final _$isPerecivelAtom =
      Atom(name: 'NewItemControllerBase.isPerecivel', context: context);

  @override
  bool get isPerecivel {
    _$isPerecivelAtom.reportRead();
    return super.isPerecivel;
  }

  @override
  set isPerecivel(bool value) {
    _$isPerecivelAtom.reportWrite(value, super.isPerecivel, () {
      super.isPerecivel = value;
    });
  }

  late final _$categoriasEscolhidasAtom = Atom(
      name: 'NewItemControllerBase.categoriasEscolhidas', context: context);

  @override
  List<String> get categoriasEscolhidas {
    _$categoriasEscolhidasAtom.reportRead();
    return super.categoriasEscolhidas;
  }

  @override
  set categoriasEscolhidas(List<String> value) {
    _$categoriasEscolhidasAtom.reportWrite(value, super.categoriasEscolhidas,
        () {
      super.categoriasEscolhidas = value;
    });
  }

  late final _$NewItemControllerBaseActionController =
      ActionController(name: 'NewItemControllerBase', context: context);

  @override
  dynamic getItemListLength() {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.getItemListLength');
    try {
      return super.getItemListLength();
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getItemList() {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.getItemList');
    try {
      return super.getItemList();
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCategoriasListLength() {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.getCategoriasListLength');
    try {
      return super.getCategoriasListLength();
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCategoriasList() {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.getCategoriasList');
    try {
      return super.getCategoriasList();
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addCategoria(String value) {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.addCategoria');
    try {
      return super.addCategoria(value);
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarCategoria(String value) {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.selecionarCategoria');
    try {
      return super.selecionarCategoria(value);
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deselecionarCategoria(String value) {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.deselecionarCategoria');
    try {
      return super.deselecionarCategoria(value);
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchTab(int index) {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.switchTab');
    try {
      return super.switchTab(index);
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearInputs() {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.clearInputs');
    try {
      return super.clearInputs();
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeTextController: ${nomeTextController},
descTextController: ${descTextController},
qtdTextController: ${qtdTextController},
validadeTextController: ${validadeTextController},
dateAux: ${dateAux},
newItem: ${newItem},
isPerecivel: ${isPerecivel},
categoriasEscolhidas: ${categoriasEscolhidas}
    ''';
  }
}
