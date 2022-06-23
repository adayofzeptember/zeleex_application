import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data_Profile? data;

  Profile(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data =
        json['data'] != null ? new Data_Profile.fromJson(json['data']) : null;
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

class Data_Profile {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? phone;
  String? avatar;
  Null? provider;
  Null? providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imageProfile;
  int? storeCheck;

  Data_Profile(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.avatar,
      this.provider,
      this.providerId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imageProfile,
      this.storeCheck});

  Data_Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    avatar = json['avatar'];
    provider = json['provider'];
    providerId = json['provider_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageProfile = json['image_profile'];
    storeCheck = json['store_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_profile'] = this.imageProfile;
    data['store_check'] = this.storeCheck;
    return data;
  }
}

// Future<Data_Profile> fetchProfile_Auth(String token) async {
//   var url = "https://api.zeleex.com/api/profile";
//   var response = await http.get(Uri.parse(url), headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
//   var jsonResponse = json.decode(response.body);
//   var jsonCon = jsonResponse['data'];
//   Data_Profile user_profileData = Data_Profile.fromJson(jsonCon);
//   print(token);
//   print(user_profileData.email.toString()+user_profileData.id.toString());
//   return user_profileData;
// }

// void main(List<String> args) {
//   fetchProfile_Auth("1087|gjvZRJXl9UBNwLdMeTinp7o4it5gX8zcaR4fLB38E");
// }