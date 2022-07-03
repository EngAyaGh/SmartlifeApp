import 'dart:convert';
import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';

List<BarModel> genderModelFromJson(String str) => List<BarModel>.from(
    json.decode(str).map((x) => BarModel.fromJson(x)));

String genderModelToJson(List<BarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarModel {
  BarModel({
    required this.x,
    required this.countclient,
    required this.y,
    required this.colorval,

  });

  String x;
  int countclient;
  double y;
  Color colorval;
  // double probability;
  // int count;

  factory BarModel.fromJson(Map<String, dynamic> json) => BarModel(
    colorval:Colors.primaries[Random().nextInt(Colors.primaries.length)] ,
    x: json["x"],
    countclient:int.parse( json["countclient"]),
    y: double.parse( json["y"]),
    // probability: json["probability"].toDouble(),
    // count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "countclient": countclient,
    "y": y,
  };
}