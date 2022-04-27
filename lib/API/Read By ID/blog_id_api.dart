import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/blogs_readall_api.dart';
import '../nested_example.dart';

class Blog_Detail {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Blog_Detail(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Blog_Detail.fromJson(Map<String, dynamic> json) {
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
  Blog? blog;

  Data({this.blog});

  Data.fromJson(Map<String, dynamic> json) {
    blog = json['blog'] != null ? new Blog.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blog != null) {
      data['blog'] = this.blog!.toJson();
    }
    return data;
  }
}

class Blog {
  int? id;
  String? title;
  String? description;
  String? content;
  String? status;
  String? seoTitle;
  String? seoDescription;
  int? reads;
  Image_Blog? image;
  int? storeId;
  String? createdAt;
  String? updatedAt;

  List<Null>? tags;

  Blog({
    this.id,
    this.title,
    this.description,
    this.content,
    this.status,
    this.seoTitle,
    this.seoDescription,
    this.reads,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.tags,
  });

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    status = json['status'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    reads = json['reads'];
    image =
        json['image'] != null ? new Image_Blog.fromJson(json['image']) : null;

    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['status'] = this.status;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['reads'] = this.reads;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Image_Blog {
  String? main;
  String? thumbnail;

  Image_Blog({this.main, this.thumbnail});

  Image_Blog.fromJson(Map<String, dynamic> json) {
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




  Future<Blog> fetchBlog_ByIDxxxxxx() async {
    var url = "https://sanboxapi.zeleex.com/api/blogs/1";
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data']['blog'];
    Blog msg = Blog.fromJson(jsonCon);

    return msg;
  }


