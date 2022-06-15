import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/animals_API.dart';

// class ResponseModel_zeleex2 {

//   final String id;
//   final String name;

//   ResponseModel_zeleex2({
//     required this.id,
//     required this.name,
//   });

// factory ResponseModel_zeleex2.fromJson(Map<String, dynamic> json) {
//   return ResponseModel_zeleex2(
//       id: json['id'] != null ? json['id'] : "",
//       name: json['name'] != null ? json['name'] : "");
// }
// }
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
      this.storeCheck});
      
  factory ResponseModel_zeleex2.fromJson(Map<String, dynamic> json) {
    return ResponseModel_zeleex2(
      id: json['id'] != null ? json['id'] : "",
      name: json['name'] != null ? json['name'] : "",
      email: json['email'] != null ? json['email'] : "",
            token: json['token'] != null ? json['token'] : "",

      // emailVerifiedAt:
      //     json['emailVerifiedAt'] != null ? json['emailVerifiedAt'] : "",
      // phone: json['phone'] != null ? json['phone'] : "",
      // avatar: json['avatar'] != null ? json['avatar'] : "",
      // provider: json['provider'] != null ? json['provider'] : "",
      // providerId: json['providerId'] != null ? json['providerId'] : "",
      // status: json['status'] != null ? json['status'] : "",
      // createdAt: json['createdAt'] != null ? json['createdAt'] : "",
      // updatedAt: json['updatedAt'] != null ? json['updatedAt'] : "",
      // token: json['token'] != null ? json['token'] : "",
      // imageProfile: json['imageProfile'] != null ? json['imageProfile'] : "",
      // storeCheck: json['storeCheck'] != null ? json['storeCheck'] : "",
    );
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

Future<Login_Data> login_zeleex2(
    RequestModel_zeleex2 requestModel_zeleex2) async {
  print(
      "-----------------------------------------------Log in-----------------------------------------------------------------------");

  String urlPost = "https://api.zeleex.com/api/login";
  var bodyLogin = json.encode(requestModel_zeleex2.toJson());
  final response = await http.post(Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: bodyLogin);

  var data = jsonDecode(response.body.toString());
  print(data);
  print("--------------{$bodyLogin}---------------");

  // if (response.statusCode == 200 || response.statusCode == 400) {
  //   return ResponseModel_zeleex2.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception(Error);
  // }

  try {
    response.statusCode == 200 || response.statusCode == 400;
    return Login_Data.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw Exception("error on: " + e.toString());
  }
}
