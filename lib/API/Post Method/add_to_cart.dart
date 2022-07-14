import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Cart_Add {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Response_CartAdd? data;

  Cart_Add(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Cart_Add.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new Response_CartAdd.fromJson(json['data'])
        : null;
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

class Response_CartAdd {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  int? storeId;
  int? productSkuId;
  int? unit;

  Response_CartAdd(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.storeId,
      this.productSkuId,
      this.unit});

  Response_CartAdd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    storeId = json['store_id'];
    productSkuId = json['product_sku_id'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['product_sku_id'] = this.productSkuId;
    data['unit'] = this.unit;
    return data;
  }
}

//-------------------------------------------------------------------------------------------------------------------

class AddToCart_Request {
  int? user_id;
  int? store_id;
  int? product_sku_id;
  int? unit;

  AddToCart_Request(
      {this.user_id, this.store_id, this.product_sku_id, this.unit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['store_id'] = this.store_id;
    data['product_sku_id'] = this.product_sku_id;
    data['unit'] = this.unit;
    return data;
  }
}

Future<Cart_Add> add_to_cart_now(
    AddToCart_Request request_cartAdd, String userToken) async {
  String urlPost = "https://api.zeleex.com/api/cart/add";
  var bodyAddCart = json.encode(request_cartAdd.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    },
    body: bodyAddCart,
  );
  if (response.statusCode == 400 ||
      response.statusCode >= 200 && response.statusCode <= 299) {
    var jsonRes = json.decode(response.body);
    print("success");
    print(response.body.toString());
    return Cart_Add.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
