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
  // List<String>? email;
  // List<String>? password;

  RequestModel_zeleex2({this.email, this.password});

  RequestModel_zeleex2.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

}

Future<ResponseModel_zeleex2> login_zeleex2(
    RequestModel_zeleex2 requestModel_zeleex2) async {
  print("------------------------------------------------------------------------------------------------------------------------------");
  String urlPost = "https://api.zeleex.com/api/login";
  final response = await http.post(Uri.parse(urlPost),
      //body: json.encode(requestModel_zeleex2)
      //headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
      body: json.encode(<String, dynamic>{
        'data': [
          {
            'email': [
              json.encode(requestModel_zeleex2.email.toString()),
            ],
            'password': [
              json.encode(requestModel_zeleex2.password.toString()),
            ]
          }
        ]
      }));

  print("POST JSON: " + json.encode(requestModel_zeleex2));
  var data = jsonDecode(response.body.toString());
  var jsonCon = data['data'];
  print(data);
  if (response.statusCode == 200) {
    return ResponseModel_zeleex2.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}


















