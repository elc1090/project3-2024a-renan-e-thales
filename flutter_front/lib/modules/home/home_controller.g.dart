// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$itemListAtom =
      Atom(name: 'HomeControllerBase.itemList', context: context);

  @override
  List<Item>? get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(List<Item>? value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('HomeControllerBase.getItems', context: context);

  @override
  Future<void> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  @override
  String toString() {
    return '''
itemList: ${itemList}
    ''';
  }
}
