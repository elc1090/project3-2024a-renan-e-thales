// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.nome,
    this.qtd,
    this.description,
    this.categList,
    bool? perecivel,
    DateTime? dataVal,
    Icon? icon,
  })  : icon = icon ?? const Icon(CarbonIcons.image_reference),
        perecivel = perecivel ?? dataVal != null ? true : false,
        dataVal = dataVal != null ? dataVal.toString() : DateTime.now().toString();

  int id;
  String nome;
  Icon icon;
  int? qtd;
  String? description;
  bool perecivel;
  String? dataVal;
  List<String>? categList = [];

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      nome: map['name'],
      description: map['description'],
      categList: List.from(jsonDecode(map['category'])),
      perecivel: map['perecivel'] ?? false,
      dataVal: map['dataVal'],
    );
  }
}
