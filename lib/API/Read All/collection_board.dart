import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/cart_getUserCartList.dart';
import 'package:zeleex_application/API/url.dart';

class Board {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<Data_Collection_Board>? data;

  Board(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Board.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Collection_Board>[];
      json['data'].forEach((v) {
        data!.add(new Data_Collection_Board.fromJson(v));
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

class Data_Collection_Board {
  int? id;

  String? title;
  String? link;
  int? order;
  String? status;
  Null? createdAt;
  String? updatedAt;
  Image? image;

  Data_Collection_Board(
      {this.id,
      this.title,
      this.link,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.image});

  Data_Collection_Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }

    return data;
  }
}

class Image {
  String? main;
  String? thumbnail;

  Image({this.main, this.thumbnail});

  Image.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

Future<List<Data_Collection_Board>> fetch_collection_board() async {
  final response =
      await http.get(Uri.parse(zeleexAPI_URl.toString() + 'collection-boards'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'];

  if (response.statusCode == 200) {
    return jsonCon
        .map((data) => new Data_Collection_Board.fromJson(data))
        .toList();
  } else {
    throw Exception(Exception);
  }
}
