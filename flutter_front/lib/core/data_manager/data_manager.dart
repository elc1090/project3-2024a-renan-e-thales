import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:bcrypt/bcrypt.dart';

import 'package:flutter_front/models/item.dart';
import 'package:http/http.dart' as http;
import '../../core/globals.dart' as globals;

import '../../models/user.dart';

class DataManager {
  DataManager();

  final String domain = 'https://api-dw3.vercel.app/api';

  final Storage _localStorage = window.localStorage;

  Future save(String token) async {
    _localStorage['token'] = token;
  }

  Future<String> getToken() async => _localStorage['token'] ?? 'null';

  Future purgeToken() async {
    _localStorage.remove('token');
  }

  Future saveUser(User user) async {
    final userString = jsonEncode(user.toMap());
    _localStorage['user'] = userString;
  }

  Future fetchUser() async {
    if (_localStorage['user'] != null && _localStorage['user']!.isNotEmpty) {
      final user = User.fromMap(jsonDecode(_localStorage['user']!));
      return user;
    } else {
      return null;
    }
  }

  Future getUser(String email, String password) async {
    try {
      final res1 = await http.get(Uri.parse('$domain/user'));
      final map = jsonDecode(res1.body);
      for (var element in map['data']) {
        if (element == null) {
          continue;
        }
        if (element['attributes']['email'] == email) {
          var pwdMatch = BCrypt.checkpw(password, element['attributes']['password']);

          if (pwdMatch) {
            final Map<String, dynamic> userMap = element['attributes'];
            userMap.putIfAbsent('id', () => element['id']);
            final user = User.fromMap(userMap);

            saveUser(user);

            return user;
          }
        }
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<http.Response?> postUser(String name, String email, String password) async {
    try {
      final res = await http.post(Uri.parse('$domain/user'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'data': {
              'type': 'string',
              'attributes': {
                'name': name,
                'email': email,
                'password': password,
              }
            }
          }));
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Future.value(res);
      }
    } catch (e) {
      log(e.toString());
      return Future.value(null);
    }
    return Future.value(null);
  }

  getItemList() async {
    try {
      final res = await http.get(Uri.parse('$domain/item'));
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
      final res = await http.get(Uri.parse('$domain/item/$id'));
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
      final itemMap = item.toMap();
      itemMap.addAll({'userId': globals.user?.id});
      final bodyObj = jsonEncode({
        'data': {
          'type': 'string',
          'attributes': itemMap,
        }
      });
      final res = await http.post(Uri.parse('$domain/item'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: bodyObj);
      log(res.body);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
