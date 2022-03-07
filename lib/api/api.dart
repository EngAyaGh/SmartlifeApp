import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (json.decode(response.body)["code"] == "200") {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception(
          'there is a problem with status code ${json.decode(response.body)["code"] == "200"}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (json.decode(response.body)["code"] == "200") {
      Map<String, dynamic> data = jsonDecode(response.body)["message"];
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${json.decode(response.body)["code"] == "200"} with body ${jsonDecode(response.body)["message"]}');
    }

  }
}