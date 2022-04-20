import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Slider {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<DataSlider>? data;

  Slider(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Slider.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <DataSlider>[];
      json['data'].forEach((v) {
        data!.add(new DataSlider.fromJson(v));
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

class DataSlider {
  int? id;
  String? title;
  String? link;
  String? description;
  int? order;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? imageMobile;

  DataSlider(
      {this.id,
      this.title,
      this.link,
      this.description,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.imageMobile});

  DataSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    description = json['description'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    imageMobile = json['image_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['description'] = this.description;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['image_mobile'] = this.imageMobile;
    return data;
  }
}
Future<List<DataSlider>> fetch_SliderPics() async {
  final response =
      await http.get(Uri.parse('https://sanboxapi.zeleex.com/api/sliders'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'];
  print(jsonResponse['data']);

  if (response.statusCode == 200) {
    // List jsonResponse = json.decode(response.body);
    return jsonCon.map((data) => new DataSlider.fromJson(data)).toList();
  } else {
    throw Exception("error...");
  }
}

// void main(List<String> args) {
//   //fetchData555();
//   fetch_HelpCenter();
// }