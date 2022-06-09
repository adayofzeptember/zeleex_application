import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class ResponesModel_reqres {
  final String token;
  final String error;

  ResponesModel_reqres({required this.token, required this.error});

  factory ResponesModel_reqres.fromJSON(Map<String, dynamic> json) {
    return ResponesModel_reqres(
        token: json['token'] != null ? json['token'] : "",
        error: json['error'] != null ? json['error'] : "");
  }
}

class RequestModel_reqres {
  String? email;
  String? password;

  RequestModel_reqres({this.email, this.password});

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };

    return map;
  }
}

Future<ResponesModel_reqres> login_reqres(
    RequestModel_reqres requestModel) async {
  String urlPost = "https://reqres.in/api/login";
  final response =
      await http.post(Uri.parse(urlPost), body: requestModel.toJSON());
  print(jsonDecode(response.body.toString()));

  if (response.statusCode == 200 || response.statusCode == 400) {
    return ResponesModel_reqres.fromJSON(json.decode(response.body));
  } else {
    throw Exception('FAILED TO LOAD');
  }
}
