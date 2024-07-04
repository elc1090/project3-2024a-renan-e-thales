import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:flutter_front/models/item.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class DataManager {
  DataManager();

  final String domain = 'https://api-dw3.vercel.app/api/';

  final Storage _localStorage = window.localStorage;

  Future save(String token) async {
    _localStorage['token'] = token;
  }

  Future<String> getToken() async => _localStorage['token'] ?? 'null';

  Future purgeToken() async {
    _localStorage.remove('token');
  }

  Future<User?> getUser(String email, String password) async {
    try {
      final res = await http.get(Uri.parse('${domain}user'));
      final map = jsonDecode(res.body);
      for (var element in map['data']) {
        if (element == null) {
          continue;
        }
        if (element['attributes']['email'] == email) {
          return User.fromMap(element['attributes'], element['id']);
        }
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  getItemList() async {
    try {
      final res = await http.get(Uri.parse('${domain}item'));
      List<Item> aux = [];
      final map = jsonDecode(res.body);
      for (var element in map['data']) {
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
