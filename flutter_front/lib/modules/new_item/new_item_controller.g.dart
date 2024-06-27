// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewItemController on NewItemControllerBase, Store {
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
  dynamic switchIndex(int index) {
    final _$actionInfo = _$NewItemControllerBaseActionController.startAction(
        name: 'NewItemControllerBase.switchIndex');
    try {
      return super.switchIndex(index);
    } finally {
      _$NewItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newItem: ${newItem}
    ''';
  }
}
