import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddAddress {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  ResponseModel_AddAddress? data;

  AddAddress(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  AddAddress.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new ResponseModel_AddAddress.fromJson(json['data'])
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

class ResponseModel_AddAddress {
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? phone;
  int? userId;
  String? name;
  String? defaultt;
  String? updatedAt;
  String? createdAt;
  int? id;

  ResponseModel_AddAddress(
      {this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.phone,
      this.userId,
      this.name,
      this.defaultt,
      this.updatedAt,
      this.createdAt,
      this.id});

  ResponseModel_AddAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    phone = json['phone'];
    userId = json['user_id'];
    name = json['name'];
    defaultt = json['default'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['default'] = this.defaultt;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Provider_AddAddress {
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? defaultt;
  String? name;
  String? phone;

  Provider_AddAddress(
      {this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.defaultt,
      this.name,
      this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['default'] = this.defaultt;
    data['name'] = this.name;
    data['phone'] = this.phone;

    return data;
  }
}

Future<AddAddress> edit_address(Provider_AddAddress requestModel_AddAddress,
    String userToken, String address_table_id) async {
  String urlPost = "https://api.zeleex.com/api/address/shipping-update/" +
      address_table_id.toString();
  var body_AddAddress = json.encode(requestModel_AddAddress.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken',
    },
    body: body_AddAddress,
  );

  var jsonRes = json.decode(response.body);
  print(response.body.toString());
  if (response.statusCode == 201) {
    print(response.body.toString());
    return AddAddress.fromJson(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw Exception();
  }
}

Future<AddAddress> add_new_address(
    Provider_AddAddress requestModel_AddAddress, String userToken) async {
  String urlPost = "https://api.zeleex.com/api/address/shipping-store";
  var body_AddAddress = json.encode(requestModel_AddAddress.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken',
    },
    body: body_AddAddress,
  );
  var jsonRes = json.decode(response.body);
  print(response.body.toString());
  if (response.statusCode == 201) {
    return AddAddress.fromJson(json.decode(response.body));
  } else {
    throw Exception();
  }
}
