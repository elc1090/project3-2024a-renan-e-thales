// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemListController on ItemListControllerBase, Store {
  late final _$itemListAtom =
      Atom(name: 'ItemListControllerBase.itemList', context: context);

  @override
  List<Item> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(List<Item> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$dangerItemThresholdAtom = Atom(
      name: 'ItemListControllerBase.dangerItemThreshold', context: context);

  @override
  int get dangerItemThreshold {
    _$dangerItemThresholdAtom.reportRead();
    return super.dangerItemThreshold;
  }

  @override
  set dangerItemThreshold(int value) {
    _$dangerItemThresholdAtom.reportWrite(value, super.dangerItemThreshold, () {
      super.dangerItemThreshold = value;
    });
  }

  late final _$warningItemThresholdAtom = Atom(
      name: 'ItemListControllerBase.warningItemThreshold', context: context);

  @override
  int get warningItemThreshold {
    _$warningItemThresholdAtom.reportRead();
    return super.warningItemThreshold;
  }

  @override
  set warningItemThreshold(int value) {
    _$warningItemThresholdAtom.reportWrite(value, super.warningItemThreshold,
        () {
      super.warningItemThreshold = value;
    });
  }

  late final _$ItemListControllerBaseActionController =
      ActionController(name: 'ItemListControllerBase', context: context);

  @override
  dynamic addItem(Item value) {
    final _$actionInfo = _$ItemListControllerBaseActionController.startAction(
        name: 'ItemListControllerBase.addItem');
    try {
      return super.addItem(value);
    } finally {
      _$ItemListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDangerItemThreshold(int value) {
    final _$actionInfo = _$ItemListControllerBaseActionController.startAction(
        name: 'ItemListControllerBase.setDangerItemThreshold');
    try {
      return super.setDangerItemThreshold(value);
    } finally {
      _$ItemListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWarningItemThreshold(int value) {
    final _$actionInfo = _$ItemListControllerBaseActionController.startAction(
        name: 'ItemListControllerBase.setWarningItemThreshold');
    try {
      return super.setWarningItemThreshold(value);
    } finally {
      _$ItemListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList},
dangerItemThreshold: ${dangerItemThreshold},
warningItemThreshold: ${warningItemThreshold}
    ''';
  }
}
