import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fronJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'password': password?.trim()
    };
    return map;
  }
}

Future<LoginResponseModel> loginLOL(LoginRequestModel requestModel) async {
  String urlPost = "https://reqres.in/api/login";
  final response =
      await http.post(Uri.parse(urlPost), body: requestModel.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    return LoginResponseModel.fronJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}
