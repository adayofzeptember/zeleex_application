import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Advance_Search {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<Data_Search>? data;

  Advance_Search(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Advance_Search.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Search>[];
      json['data'].forEach((v) {
        data!.add(new Data_Search.fromJson(v));
      });
    }
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
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data_Search {
  int? id;
  String? title;

  Data_Search({this.id, this.title});

  Data_Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

Future<List<Data_Search>> fetch_search() async {
  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/search?keyword=en'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'];
  var ee = jsonResponse['data'][0].toString();
 
 

  // print(jsonCon.length);
  if (response.statusCode == 200) {
    // print(jsonResponse.toString());
    // print(ee.toString());
    return jsonCon.map((data) => Data_Search.fromJson(data)).toList();
  } else {
    throw Exception("error");
  }
}



