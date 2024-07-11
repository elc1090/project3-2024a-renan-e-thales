// ignore_for_file: constant_identifier_names
import 'dart:math';
import 'dart:convert';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.nome,
    this.estoqueId,
    this.kgl,
    this.qtd,
    this.description,
    this.categList,
    bool? perecivel,
    DateTime? dataVal,
    Icon? icon,
  })  : icon = icon ?? const Icon(CarbonIcons.image_reference),
        perecivel = perecivel ?? dataVal != null ? true : false,
        dataVal = dataVal != null ? dataVal.toString() : DateTime.now().toString();

  String id;
  String nome;
  Icon icon;
  int? kgl;
  int? qtd;
  String? description;
  bool perecivel;
  String? dataVal;
  List<String>? categList = [];
  String? estoqueId;

  factory Item.fromMap(Map<String, dynamic> map, String id) {
    return Item(
      id: id,
      nome: map['name'],
      estoqueId: map['estoqueId'],
      kgl: map['kgl'],
      qtd: map['qtd'] == 0 ? Random().nextInt(100) : map['qtd'],
      description: map['description'],
      categList: [map['category']],
      perecivel: map['perecivel'] ?? false,
      dataVal: DateTime.parse(map['dataVal']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': nome,
      'description': description,
      'qtd': qtd,
      'kgl': kgl ?? 0,
      'dataVal': dataVal,
      'perecivel': perecivel,
      'category': categList.toString(),
    };
  }
}
