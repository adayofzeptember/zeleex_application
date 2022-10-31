import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Product_Favorite {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Product_Favorite(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Product_Favorite.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    data['sessionID'] = this.sessionID;
    data['serverDateTimeMS'] = this.serverDateTimeMS;
    data['serverDatetime'] = this.serverDatetime;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? hasFavorite;

  Data({this.hasFavorite});

  Data.fromJson(Map<String, dynamic> json) {
    hasFavorite = json['hasFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasFavorite'] = this.hasFavorite;
    return data;
  }
}

class Product_Fave_Model {
  String? user_id;
  String? product_id;

  Product_Fave_Model({
    this.user_id,
    this.product_id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['product_id'] = this.product_id;

    return data;
  }
}

Future<Product_Favorite> user_product_favorite(
    Product_Fave_Model faveModel, String token) async {
  String urlPost = "https://api.zeleex.com/api/product/user/favorite";
  var body_produvtFave = json.encode(faveModel.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: body_produvtFave,
  );

  print(json.decode(response.body.toString()));
  var jsonRes = json.decode(response.body);

  if (response.statusCode == 400 || response.statusCode == 200) {
    return Product_Favorite.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
