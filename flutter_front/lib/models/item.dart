// ignore_for_file: constant_identifier_names
import 'dart:math';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.nome,
    this.estoqueId,
    double? peso,
    String? medida,
    this.qtd,
    this.description,
    List<int>? categList,
    bool? perecivel,
    DateTime? dataVal,
    Icon? icon,
  })  : icon = icon ?? const Icon(CarbonIcons.image_reference),
        perecivel = perecivel ?? dataVal != null ? true : false,
        dataVal = dataVal != null ? dataVal.toString() : DateTime.now().toString(),
        peso = peso ?? 0.0,
        medida = medida ?? 'g',
        categList = categList ?? [];

  String id;
  String nome;
  Icon icon;
  double peso;
  String medida;
  int? qtd;
  String? description;
  bool perecivel;
  String? dataVal;
  List<int> categList = [];
  String? estoqueId;

  factory Item.fromMap(Map<String, dynamic> map, String id) {
    return Item(
      id: id,
      nome: map['name'],
      estoqueId: map['estoqueId'],
      peso: double.parse(map['peso']) ?? 0,
      medida: map['medida'] ?? 'g',
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
      'qtd': qtd ?? 0,
      'peso': '$peso$medida',
      'dataVal': dataVal != null ? DateTime.parse(dataVal!).toIso8601String() : null,
      'perecivel': perecivel,
      'category': categList,
    };
  }
}
