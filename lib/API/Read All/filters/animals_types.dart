import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Animal_Types {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Animal_Types(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Animal_Types.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Data_AnimalCategory>? animalCategory;
  int? animalMax;
  int? animalMin;

  Data({this.animalCategory, this.animalMax, this.animalMin});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['animal_category'] != null) {
      animalCategory = <Data_AnimalCategory>[];
      json['animal_category'].forEach((v) {
        animalCategory!.add(new Data_AnimalCategory.fromJson(v));
      });
    }
    animalMax = json['animal_max'];
    animalMin = json['animal_min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animalCategory != null) {
      data['animal_category'] =
          this.animalCategory!.map((v) => v.toJson()).toList();
    }
    data['animal_max'] = this.animalMax;
    data['animal_min'] = this.animalMin;
    return data;
  }
}

class Data_AnimalCategory {
  int? id;
  String? title;
  String? status;
  String? description;
  String? order;
  int? iLft;
  int? iRgt;
  Null? parentId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? animalCount;
  int? depth;
  List<Children>? children;

  Data_AnimalCategory(
      {this.id,
      this.title,
      this.status,
      this.description,
      this.order,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.animalCount,
      this.depth,
      this.children});

  Data_AnimalCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    description = json['description'];
    order = json['order'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    animalCount = json['animal_count'];
    depth = json['depth'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['description'] = this.description;
    data['order'] = this.order;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['animal_count'] = this.animalCount;
    data['depth'] = this.depth;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? id;
  String? title;
  String? status;
  String? description;
  String? order;
  int? iLft;
  int? iRgt;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? animalCount;
  int? depth;

  Children({
    this.id,
    this.title,
    this.status,
    this.description,
    this.order,
    this.iLft,
    this.iRgt,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.animalCount,
    this.depth,
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    description = json['description'];
    order = json['order'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    animalCount = json['animal_count'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['description'] = this.description;
    data['order'] = this.order;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['animal_count'] = this.animalCount;
    data['depth'] = this.depth;
    return data;
  }
}

Future<List<Data_AnimalCategory>> fetch_animal_cat() async {
  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/animal/categories'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['animal_category'];
  var childrenOfCat = jsonResponse['data']['animal_category'][1]['children'].toString();
  if (response.statusCode == 200) {
    //print(jsonResponse.toString());
    print(childrenOfCat.toString());
    return jsonCon.map((data) => Data_AnimalCategory.fromJson(data)).toList();
  } else {
    throw Exception("error");
  }
}

void main(List<String> args) {
  fetch_animal_cat();

}
