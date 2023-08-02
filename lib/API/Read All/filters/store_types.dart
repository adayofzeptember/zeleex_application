import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Filter_Store_Types {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<Data_Store_Types>? data;

  Filter_Store_Types(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Filter_Store_Types.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Store_Types>[];
      json['data'].forEach((v) {
        data!.add(new Data_Store_Types.fromJson(v));
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

class Data_Store_Types {
  int? id;
  String? title;
  String? description;
  String? status;
  String? order;
  Null createdAt;
  Null updatedAt;
  Null deletedAt;
  int? storesCount;

  Data_Store_Types(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.storesCount});

  Data_Store_Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    storesCount = json['stores_count'];
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
    data['deleted_at'] = this.deletedAt;
    data['stores_count'] = this.storesCount;
    return data;
  }
}

Future<List<Data_Store_Types>> fetch_store_types() async {
  final response =
      await http.get(Uri.parse('https://admin.zeleex.com/api/store/types'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'];

  if (response.statusCode == 200) {
    return jsonCon.map((data) => Data_Store_Types.fromJson(data)).toList();
  } else {
    throw Exception("error");
  }
}

