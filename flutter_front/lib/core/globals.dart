library flutter_front.globals;

import 'package:flutter_front/core/custom_widgets/custom_toast/custom_toast_controller.dart';
import 'package:flutter_front/core/data_manager/data_manager.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_front/modules/item_list_page/item_list_controller.dart';

import '../modules/new_item/new_item_controller.dart';

DataManager dataManager = DataManager();

HomeController homeController = HomeController();
NewItemController newItemController = NewItemController();
ItemListController itemListController = ItemListController();
CustomToastController toastController = CustomToastController();

bool isLoggedIn = false;

String version = "v0.0.1";

List<Item> items = [
  Item(id: 1, nome: "Pacote de Arroz", qtd: 20, description: "Um pacote de arroz de 1Kg", categList: ["Suprimento", "Carboidrato", "Amido"]),
  Item(id: 2, nome: "Lata de Café", qtd: 30, description: "Uma lata de café de 250g", categList: ["Suprimento"]),
  Item(id: 3, nome: "Pacote de Farinha de Milho", qtd: 45, description: "Um pacote de farinha de milho de 1Kg", categList: ["Suprimento", "Amido"]),
  Item(id: 4, nome: "Pacote de Farinha de Mandioca", qtd: 10, description: "Um pacote de farinha de mandioca de 1Kg", categList: ["Suprimento", "Amido"]),
  Item(id: 5, nome: "Lata de Pêssego", qtd: 9, description: "Uma lata de pêssego de 500g", categList: ["Suprimento", "Proteína"]),
  Item(id: 6, nome: "Pacote de Feijão", qtd: 5, description: "Um pacote de feijão de 1Kg", categList: ["Suprimento", "Proteína", "Ferro"]),
  Item(id: 7, nome: "Bandeja de Carne", qtd: 15, description: "Uma bandeja de carne bovina de 1Kg", categList: ["Suprimento", "Proteína", "Ferro"]),
];

List<String> categorias = [
  "Suprimento",
  "Higiene Pessoal",
  "Vestimenta",
  "Limpeza",
  "Carboidrato",
  "Ferro",
  "Proteína",
  "Amido",
];
