// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomItemController on CustomItemControllerBase, Store {
  late final _$nameControllerAtom =
      Atom(name: 'CustomItemControllerBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$descriptionControllerAtom = Atom(
      name: 'CustomItemControllerBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$itemAtom =
      Atom(name: 'CustomItemControllerBase.item', context: context);

  @override
  Item get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Item value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$categoriasAtom =
      Atom(name: 'CustomItemControllerBase.categorias', context: context);

  @override
  List<String> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<String> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  late final _$updateQtdAsyncAction =
      AsyncAction('CustomItemControllerBase.updateQtd', context: context);

  @override
  Future<void> updateQtd(int qtd) {
    return _$updateQtdAsyncAction.run(() => super.updateQtd(qtd));
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('CustomItemControllerBase.deleteItem', context: context);

  @override
  Future<void> deleteItem(int id) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(id));
  }

  late final _$CustomItemControllerBaseActionController =
      ActionController(name: 'CustomItemControllerBase', context: context);

  @override
  dynamic addItemCategoria(String value) {
    final _$actionInfo = _$CustomItemControllerBaseActionController.startAction(
        name: 'CustomItemControllerBase.addItemCategoria');
    try {
      return super.addItemCategoria(value);
    } finally {
      _$CustomItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItemCategoria(String value) {
    final _$actionInfo = _$CustomItemControllerBaseActionController.startAction(
        name: 'CustomItemControllerBase.removeItemCategoria');
    try {
      return super.removeItemCategoria(value);
    } finally {
      _$CustomItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateGlobalItem(Item item) {
    final _$actionInfo = _$CustomItemControllerBaseActionController.startAction(
        name: 'CustomItemControllerBase.updateGlobalItem');
    try {
      return super.updateGlobalItem(item);
    } finally {
      _$CustomItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeGlobalItem(Item item) {
    final _$actionInfo = _$CustomItemControllerBaseActionController.startAction(
        name: 'CustomItemControllerBase.removeGlobalItem');
    try {
      return super.removeGlobalItem(item);
    } finally {
      _$CustomItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
descriptionController: ${descriptionController},
item: ${item},
categorias: ${categorias}
    ''';
  }
}
