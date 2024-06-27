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
    DateTime? dataVal,
    Icon? icon,
  })  : icon = icon ?? Icon(CarbonIcons.image_reference),
        dataVal = dataVal != null ? dataVal.toString() : DateTime.now().toString();

  int id;
  String nome;
  Icon icon;
  int? qtd;
  String? description;
  String? dataVal;
  List<String>? categList = [];

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      nome: map['nome'],
      dataVal: map['dataVal'],
    );
  }
}
