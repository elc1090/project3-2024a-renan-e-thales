library flutter_front.globals;

import 'package:flutter_front/core/widgets/custom_toast/custom_toast_controller.dart';
import 'package:flutter_front/core/data_manager/data_manager.dart';
import 'package:flutter_front/models/categoria.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/models/user.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_front/modules/item_list_page/item_list_controller.dart';
import 'package:flutter_front/modules/login/login_controller.dart';
import 'package:flutter_front/modules/register/register_controller.dart';
import 'package:uuid/uuid.dart';

import '../modules/new_item/categorias_list/categorias_list_controller.dart';
import '../modules/new_item/new_item_controller.dart';

DataManager dataManager = DataManager();

RegisterController registerController = RegisterController();
LoginController loginController = LoginController();
HomeController homeController = HomeController();
NewItemController newItemController = NewItemController();
ItemListController itemListController = ItemListController();
CustomToastController toastController = CustomToastController();
CategoriasListController categoriasListController = CategoriasListController(categorias: categorias);

bool isLoggedIn = false;

User? user;

String version = "v0.0.1";

List<Item> items = [];

List<Item> itemsMocado = [
  Item(
    id: const Uuid().v4(),
    estoqueId: '1',
    nome: "Pacote de Arroz",
    qtd: 20,
    peso: 1,
    medida: 'Kg',
    description: "Um pacote de arroz de 1Kg",
    categList: [0, 8, 6],
  ),
  Item(
    id: const Uuid().v4(),
    estoqueId: '2',
    nome: "Lata de Café",
    qtd: 30,
    peso: 250,
    medida: 'g',
    description: "Uma lata de café de 250g",
    categList: [0],
  ),
  Item(
      id: const Uuid().v4(),
      estoqueId: '3',
      nome: "Pacote de Farinha de Milho",
      qtd: 45,
      peso: 1,
      medida: 'Kg',
      description: "Um pacote de farinha de milho de 1Kg",
      categList: [0, 6]),
  Item(
      id: const Uuid().v4(),
      estoqueId: '4',
      nome: "Pacote de Farinha de Mandioca",
      qtd: 10,
      peso: 1,
      medida: 'Kg',
      description: "Um pacote de farinha de mandioca de 1Kg",
      categList: [0, 6]),
  Item(
    id: const Uuid().v4(),
    estoqueId: '5',
    nome: "Lata de Pêssego",
    qtd: 9,
    peso: 250,
    medida: 'g',
    description: "Uma lata de pêssego de 500g",
    categList: [0, 5],
  ),
  Item(
    id: const Uuid().v4(),
    estoqueId: '6',
    nome: "Pacote de Feijão",
    qtd: 5,
    peso: 1,
    medida: 'Kg',
    description: "Um pacote de feijão de 1Kg",
    categList: [0, 5, 4],
  ),
  Item(
    id: const Uuid().v4(),
    estoqueId: '7',
    nome: "Bandeja de Carne",
    qtd: 15,
    peso: 1,
    medida: 'Kg',
    description: "Uma bandeja de carne bovina de 1Kg",
    categList: [0, 5, 4],
  ),
  Item(
    id: const Uuid().v4(),
    estoqueId: '7',
    nome: "Caixa de Leite",
    qtd: 15,
    peso: 1,
    medida: 'L',
    description: "Uma caixa de leite de 1 litro",
    categList: [0, 5, 7],
  ),
];

List<Categoria> categorias = [
  Categoria(id: 0, nome: "Suprimento"),
  Categoria(id: 1, nome: "Higiene Pessoal"),
  Categoria(id: 2, nome: "Vestimenta"),
  Categoria(id: 3, nome: "Limpeza"),
  Categoria(id: 4, nome: "Ferro"),
  Categoria(id: 5, nome: "Proteína"),
  Categoria(id: 6, nome: "Amido"),
  Categoria(id: 7, nome: "Laticínio"),
  Categoria(id: 8, nome: "Carboidrato"),
];
