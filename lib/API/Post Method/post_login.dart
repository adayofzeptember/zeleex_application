import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Login_Data {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  ResponseModel_zeleex2? data;

  Login_Data(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Login_Data.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new ResponseModel_zeleex2.fromJson(json['data'])
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
      data['data'] = this.data;
    }
    return data;
  }
}

class ResponseModel_zeleex2 {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? phone;
  Null? avatar;
  Null? provider;
  Null? providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? imageProfile;
  int? storeCheck;
  String? error;

  ResponseModel_zeleex2(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.avatar,
      this.provider,
      this.providerId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.imageProfile,
      this.storeCheck,
      this.error});

  factory ResponseModel_zeleex2.fromJson(Map<String, dynamic> json) {
    return ResponseModel_zeleex2(
        id: json['id'] != null ? json['id'] : null, //! : ""
        name: json['name'] != null ? json['name'] : null,
        email: json['email'] != null ? json['email'] : null,
        emailVerifiedAt:
            json['emailVerifiedAt'] != null ? json['emailVerifiedAt'] : null,
        phone: json['phone'] != null ? json['phone'] : null,
        avatar: json['avatar'] != null ? json['avatar'] : null,
        provider: json['provider'] != null ? json['provider'] : null,
        providerId: json['providerId'] != null ? json['providerId'] : null,
        status: json['status'] != null ? json['status'] : null,
        createdAt: json['createdAt'] != null ? json['createdAt'] : null,
        updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
        token: json['token'] != null ? json['token'] : null,
        imageProfile:
            json['imageProfile'] != null ? json['imageProfile'] : null,
        storeCheck: json['storeCheck'] != 0 ? json['storeCheck'] : null,
        error: json['error'] != null ? json['error'] : null);
  }
}

class RequestModel_zeleex2 {
  String? email;
  String? password;

  RequestModel_zeleex2({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

Future<Login_Data> login(RequestModel_zeleex2 requestModel_zeleex2) async {
  print(
      "-----------------------------------------------Login-----------------------------------------------------------------------");

  String urlPost = "https://api.zeleex.com/api/login";
  var body_Login = json.encode(requestModel_zeleex2.toJson());
  final response = await http.post(Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: body_Login);

  print(jsonDecode(response.body.toString()));

  try {
    response.statusCode == 200 || response.statusCode == 400;
    return Login_Data.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw Exception("error on: " + e.toString());
  }
}
