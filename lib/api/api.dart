import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class Api {
  // headers: {
  // "Accept": "application/json",
  // "Access-Control-Allow-Origin": "*"}
  Future<dynamic> get({required String url}) async {
    // final client = RetryClient(http.Client());
    // try {
    //   print(await client.get(Uri.http('example.org', '')));
    // } finally {
    //   client.close();
    // }
    // http.Response response = await http.get(
    //   Uri.parse(url),
    // );
    http.Response response = await RetryClient(http.Client()).get( Uri.parse(url));
    if (json.decode(response.body)["code"] == "200") {
      print(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      print("ex is ${json.decode(response.body)["code"] == "200"}");
      throw Exception(
          '${json.decode(response.body)["code"] == "200"}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic? body,
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


    String result= response.body;
    int idx = result.indexOf("{");
    int length=result.length;
    result=result.substring(idx,length);
    print(result);
    print(json.decode(result)["code"]);
    if (json.decode(result)["code"] == "200") {

      return jsonDecode(result)["message"];
    } else {

      throw Exception(
          '${json.decode(result)["message"]}');
    }

  }


  Future<dynamic> delete({

    required String url,
    @required dynamic? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

   // var response = await Dio().delete(
   //      url,queryParameters: {'fk_product':1,},
    http.Response response = await http.delete(
      Uri.parse(url),
     //   headers:   {
     //    "Accept": "application/json",
     //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
     //
     // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
     //   'Content-Type': 'application/json; charset=UTF-8',
     //  //  "Access-Control-Allow-Headers":
     //  // "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
     // // "Access-Control-Allow-Methods": "*"
     // },
    );

    String result= response.body;
    int idx = result.indexOf("{");
    int length=result.length;
    result=result.substring(idx,length);
    print(result);
    print(json.decode(result)["code"]);
    //if (json.decode(result)["code"] == "200") {
      /*String data="";
      if(jsonDecode(result)["message"]=="done")
        data =jsonDecode(result)["message"] ;
      else
        Map<String, dynamic>  jsonDecode(result)["message"];*/
      //print("in json data is $data");
    //   return jsonDecode(result)["message"];
    // } else {
    //
    //   throw Exception(
    //       '${json.decode(result)["message"]}');
    // }
    return jsonDecode(result)["message"];

  }
}