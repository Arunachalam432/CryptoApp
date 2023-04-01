// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinData {
  Future getCoinData() async {
    http.Response response = await http
        .get(Uri.parse('http://139.59.57.191:5000/user/getCryptoList'));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
