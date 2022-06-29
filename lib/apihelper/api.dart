import 'dart:convert';

import 'package:http/http.dart' as http;

import '../shared/constants.dart';

class Api {
  String baseUrl = 'http://rescuerapp-001-site1.gtempurl.com/api/';

  Map<String, String> headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(baseUrl + url),
      body: jsonEncode(body),
      headers: headers,
    );

    print(response.body);

    return response.body;
  }
}
