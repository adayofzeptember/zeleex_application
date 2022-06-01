import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/test%20folder/response_model.dart';

class Request_Model {
  String? email;
  String? password;

  Request_Model({this.email, this.password});

  // Request_Model.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   password = json['password'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

Future<ResponseModel> login_zeleex(Request_Model requestModel) async {
  String urlPost = "https://sanboxapi.zeleex.com/api/login";
  final response = await http.post(Uri.parse(urlPost),
      headers: {"Accept": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'email': requestModel.email.toString(),
        'password': requestModel.password.toString()
      })
      //body: requestModel.toJson()
      );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    var jsonCon = data['data'];
    print(jsonDecode(response.body.toString()));
    print(jsonCon);
    //!Instance of 'ResponseModel'
    return ResponseModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
