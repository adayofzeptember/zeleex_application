import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/main.dart';


class Shipping_List {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<Data_Shipping_List>? data;

  Shipping_List(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Shipping_List.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Shipping_List>[];
      json['data'].forEach((v) {
        data!.add(new Data_Shipping_List.fromJson(v));
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

class Data_Shipping_List {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? phone;
  int? default_status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Data_Shipping_List(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.phone,
      this.default_status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data_Shipping_List.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    phone = json['phone'];
    default_status = json['default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['default'] = this.default_status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

Future<List<Data_Shipping_List>> fetch_shipping_list(String userToken) async {
  final response = await http
      .get(Uri.parse('https://api.zeleex.com/api/address/shipping'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $userToken',
  });

  final jsonResponse = json.decode(response.body) as Map<dynamic, dynamic>;

  List jsonCon = jsonResponse['data'];

  if (response.statusCode == 200) {
    return jsonCon.map((data) => Data_Shipping_List.fromJson(data)).toList();
  } else {
    throw Exception('error response =! 200');
  }
}
