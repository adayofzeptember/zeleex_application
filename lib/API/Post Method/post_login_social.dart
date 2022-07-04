import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Login_Social_Data {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Login_Social_Data(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Login_Social_Data.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? provider;
  String? providerId;
  String? avatar;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;
  String? imageProfile;
  int? storeCheck;

  Data(
      {this.name,
      this.email,
      this.provider,
      this.providerId,
      this.avatar,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.token,
      this.imageProfile,
      this.storeCheck});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    provider = json['provider'];
    providerId = json['provider_id'];
    avatar = json['avatar'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
    imageProfile = json['image_profile'];
    storeCheck = json['store_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['avatar'] = this.avatar;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    data['image_profile'] = this.imageProfile;
    data['store_check'] = this.storeCheck;
    return data;
  }
}

class Request_Social_Provider {
  String? name;
  String? email;
  String? avatar;
  String? provider;
  String? provider_id;

  Request_Social_Provider(
      {this.name, this.email, this.avatar, this.provider, this.provider_id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['provider'] = this.provider;
    data['provider_id'] = this.provider_id;
    return data;
  }
}

