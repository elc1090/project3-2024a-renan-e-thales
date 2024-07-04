import 'dart:convert';
import 'dart:developer';

import 'package:flutter_front/models/item.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class DataManager {
  DataManager();

  String domain = 'https://api-dw3.vercel.app/api/';

  getUser(String email) async {
    try {
      final res = await http.get(Uri.parse('${domain}user'));
      log(res.body);
      final map = jsonDecode(res.body);
      for (var element in map['data']) {
        print(element.toString());
        if (element == null) {
          continue;
        }
        if (element['attributes']['email'] == email) {
          return User.fromMap(element['attributes'], element['id']);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getItemList() async {
    try {
      final res = await http.get(Uri.parse('${domain}item'));
      log(res.body);
      List<Item> aux = [];
      final map = jsonDecode(res.body);
      for (var element in map['data']) {
        print(element.toString());
        if (element == null) {
          continue;
        }
        aux.add(Item.fromMap(element['attributes'], element['id']));
      }
      return aux;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Item?> getItemById(String id) async {
    try {
      final res = await http.get(Uri.parse('${domain}item/$id'));
      log(res.body);
      final aux = jsonDecode(res.body);
      Item itemAux = Item.fromMap(aux['data']['value']['attributes'], aux['data']['value']['id']);
      return itemAux;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<dynamic> postItem(Item item) async {
    try {
      final res = await http.post(Uri.parse('${domain}item'), body: item.toMap());
      log(res.body);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
