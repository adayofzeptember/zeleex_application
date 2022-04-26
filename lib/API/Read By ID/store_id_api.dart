import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Store_Detail {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data_Store? data;

  Store_Detail(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Store_Detail.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null ? new Data_Store.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data_Store {
  int? id;
  String? title;
  String? status;
  String? address;
  String? email;
  String? phone;
  String? content;
  Null? lat;
  Null? lng;
  int? reads;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Image_for_store? image;
  Image_for_store? imageCover;
  int? productCount;
  int? animalCount;
  int? blogCount;
  int? subscribeCount;
  List<Types>? types;

  Data_Store(
      {this.id,
      this.title,
      this.status,
      this.address,
      this.email,
      this.phone,
      this.content,
      this.lat,
      this.lng,
      this.reads,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.imageCover,
      this.productCount,
      this.animalCount,
      this.blogCount,
      this.subscribeCount,
      this.types});

  Data_Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    content = json['content'];
    lat = json['lat'];
    lng = json['lng'];
    reads = json['reads'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null
        ? new Image_for_store.fromJson(json['image'])
        : null;
    imageCover = json['image_cover'] != null
        ? new Image_for_store.fromJson(json['image_cover'])
        : null;
    productCount = json['product_count'];
    animalCount = json['animal_count'];
    blogCount = json['blog_count'];
    subscribeCount = json['subscribe_count'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['content'] = this.content;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['reads'] = this.reads;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.imageCover != null) {
      data['image_cover'] = this.imageCover!.toJson();
    }
    data['product_count'] = this.productCount;
    data['animal_count'] = this.animalCount;
    data['blog_count'] = this.blogCount;
    data['subscribe_count'] = this.subscribeCount;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image_for_store {
  String? main;
  String? thumbnail;

  Image_for_store({this.main, this.thumbnail});

  Image_for_store.fromJson(Map<String, dynamic> json) {
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

class Types {
  int? id;
  String? title;
  String? description;
  String? status;
  String? order;
  Null? createdAt;
  Null? updatedAt;
  Pivot? pivot;

  Types(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? storeId;
  int? typeId;

  Pivot({this.storeId, this.typeId});

  Pivot.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['type_id'] = this.typeId;
    return data;
  }
}

Future<Data_Store> fetchStore_ByID() async {
  var url = "https://sanboxapi.zeleex.com/api/stores/1";
  var response = await http.get(Uri.parse(url));
  var jsonResponse = json.decode(response.body);
  var jsonCon = jsonResponse['data'];
  Data_Store msg = Data_Store.fromJson(jsonCon);
  //print(msg.id.toString() + "  " + msg.title.toString());
  return msg;
}

void main(List<String> args) {
  fetchStore_ByID();
}
