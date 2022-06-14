import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/animals_API.dart';

class ResponseModel_zeleex2 {
  final String id;
  final String name;

  ResponseModel_zeleex2({
    required this.id,
    required this.name,
  });

  factory ResponseModel_zeleex2.fromJson(Map<String, dynamic> json) {
    return ResponseModel_zeleex2(
        id: json['id'] != null ? json['id'] : "",
        name: json['name'] != null ? json['name'] : "");
  }
}

class RequestModel_zeleex2 {
  String? email;
  String? password;
  //  List<String>? email;
  //  List<String>? password;

  RequestModel_zeleex2({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

//body: json.encode(requestModel_zeleex2)
//  'data': [
//         {
//           "email": [
//             json.encode(requestModel_zeleex2.email)
//             ],
//           "password": [
//             json.encode(requestModel_zeleex2.password),
//           ]
//         }
//       ]

Future<ResponseModel_zeleex2> login_zeleex2(
    RequestModel_zeleex2 requestModel_zeleex2) async {
  print(
      "-----------------------------------------------Log in-----------------------------------------------------------------------");

  String urlPost = "https://api.zeleex.com/api/login";
  var bodyLogin = json.encode(requestModel_zeleex2.toJson());
  final response = await http.post(Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
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
    return ResponseModel_zeleex2.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    print("throwing new error");
    throw Exception("Error on server");
  }
}
