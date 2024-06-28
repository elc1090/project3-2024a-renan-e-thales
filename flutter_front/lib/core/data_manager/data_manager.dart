import 'dart:convert';
import 'dart:developer';

import 'package:flutter_front/models/item.dart';
import 'package:http/http.dart' as http;

class DataManager {
  DataManager();

  String domain = 'https://api-dw3.vercel.app/api/';

  getItemList() async {
    try {
      final res = await http.get(Uri.parse('https://api-dw3.vercel.app/api/item'));
      log(res.body);
      List<Item> aux = List.from(jsonDecode(res.body));
      return aux;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
