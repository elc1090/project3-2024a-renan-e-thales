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

  late final _$categoriasAtom =
      Atom(name: 'HomeControllerBase.categorias', context: context);

  @override
  List<String>? get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<String>? value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  late final _$tabsControllerAtom =
      Atom(name: 'HomeControllerBase.tabsController', context: context);

  @override
  TabController get tabsController {
    _$tabsControllerAtom.reportRead();
    return super.tabsController;
  }

  bool _tabsControllerIsInitialized = false;

  @override
  set tabsController(TabController value) {
    _$tabsControllerAtom.reportWrite(
        value, _tabsControllerIsInitialized ? super.tabsController : null, () {
      super.tabsController = value;
      _tabsControllerIsInitialized = true;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('HomeControllerBase.getItems', context: context);

  @override
  Future<void> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  late final _$getCategoriasAsyncAction =
      AsyncAction('HomeControllerBase.getCategorias', context: context);

  @override
  Future<void> getCategorias() {
    return _$getCategoriasAsyncAction.run(() => super.getCategorias());
  }

  late final _$deletItemAsyncAction =
      AsyncAction('HomeControllerBase.deletItem', context: context);

  @override
  Future<void> deletItem(int id) {
    return _$deletItemAsyncAction.run(() => super.deletItem(id));
  }

  late final _$addCategoriaAsyncAction =
      AsyncAction('HomeControllerBase.addCategoria', context: context);

  @override
  Future<void> addCategoria(String categoria) {
    return _$addCategoriaAsyncAction.run(() => super.addCategoria(categoria));
  }

  late final _$updateQtdAsyncAction =
      AsyncAction('HomeControllerBase.updateQtd', context: context);

  @override
  Future<void> updateQtd(Item item, int qtd) {
    return _$updateQtdAsyncAction.run(() => super.updateQtd(item, qtd));
  }

  @override
  String toString() {
    return '''
itemList: ${itemList},
categorias: ${categorias},
tabsController: ${tabsController}
    ''';
  }
}
