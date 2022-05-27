import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
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

// class LoginResponseModel {
//   String? token;
//   String? error;

//   LoginResponseModel({this.token});

//   LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     token = json['error'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     data['error'] = this.error;
//     return data;
//   }
// }


// class LoginRequestModel {
//   String? email;
//   String? password;

//   LoginRequestModel({this.email, this.password});

//   LoginRequestModel.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }



Future<LoginResponseModel> loginLOL(LoginRequestModel requestModel) async {
  String urlPost = "https://reqres.in/api/login";
  final response =
      await http.post(Uri.parse(urlPost), body: requestModel.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    return LoginResponseModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to connect.");
  }
}
