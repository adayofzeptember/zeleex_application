import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

//*------------------------------------------------เรสพอนส์ ตอบกลับเมื่อสog in--------------------------------------------------------

class ResponseModel_zeleex {
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
  //String? error;

  ResponseModel_zeleex({
    this.id,
    this.name,
    this.email,
    //this.error
    // this.emailVerifiedAt,
    // this.phone,
    // this.avatar,
    // this.provider,
    // this.providerId,
    // this.status,
    // this.createdAt,
    // this.updatedAt,
    // this.token,
    // this.imageProfile,
    // this.storeCheck
  });

  factory ResponseModel_zeleex.fromJson(Map<String, dynamic> json) {
    return ResponseModel_zeleex(
      // id: json["id"] != null ? json["id"] : "",
      // name: json["name"] != null ? json["name"] : "",
      email: json["email"] != null ? json["email"] : "",
      //error: json["error"] != null ? json["error"] : "",
    );
  }
}

//!------------------------------------------------รีเควส email password --------------------------------------------------------

class RequestModel_zeleex {
  String? email;
  String? password;

  RequestModel_zeleex({this.email, this.password});
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

Future<ResponseModel_zeleex> login_zeleex(RequestModel_zeleex requestModel) async {
  print(requestModel.email.toString());
  String urlPost = "https://api.zeleex.com/api/login";
  final response = await http.post(Uri.parse(urlPost),
      headers: {"Accept": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'email': requestModel.email.toString(),
        'password': requestModel.password.toString()
      })

      );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    var jsonCon = data['data'];
    print(jsonDecode(response.body.toString()));
    print(jsonCon);
    print(ResponseModel_zeleex.fromJson(json.decode(response.body)));

    return ResponseModel_zeleex.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
