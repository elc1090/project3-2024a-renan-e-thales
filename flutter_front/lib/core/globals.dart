library flutter_front.globals;

import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_front/modules/item_list_page/item_list_controller.dart';

import '../modules/new_item/new_item_controller.dart';

HomeController homeController = HomeController();
NewItemController newItemController = NewItemController();
ItemListController itemListController = ItemListController();

bool isLoggedIn = false;

String version = "v0.0.1";

List<Item> items = [
  Item(id: 1, nome: "Pacote de Arroz", qtd: 20),
  Item(id: 2, nome: "Lata de Café", qtd: 30),
  Item(id: 3, nome: "Pacote de Farinha de Milho", qtd: 45),
  Item(id: 4, nome: "Pacote de Farinha de Mandioca", qtd: 10),
  Item(id: 5, nome: "Lata de Pêssego", qtd: 9),
  Item(id: 6, nome: "Pacote de Feijão", qtd: 5),
  Item(id: 7, nome: "Bandeja de Carne", qtd: 15),
];

List<String> categorias = [
  "Suprimento",
  "Higiene Pessoal",
  "Perecível",
  "Não-Perecível",
];
