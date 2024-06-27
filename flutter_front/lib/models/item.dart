// ignore_for_file: constant_identifier_names

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.nome,
    this.qtd,
    this.description,
    this.categList,
    Icon? icon,
  }) : icon = icon ?? Icon(CarbonIcons.image_reference);

  int id;
  String nome;
  Icon icon;
  int? qtd;
  String? description;
  List<String>? categList = [];
  bool isOpen = false;

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      nome: map['nome'],
    );
  }

  _toggleOpen() {
    isOpen = !isOpen;
  }
}
