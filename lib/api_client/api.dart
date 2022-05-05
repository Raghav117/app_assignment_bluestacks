import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {}
  }
}
