import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product_Types {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Product_Types(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Product_Types.fromJson(Map<String, dynamic> json) {
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
  List<Data_Product_Types>? productCategory;
  int? productMax;
  int? productMin;

  Data({this.productCategory, this.productMax, this.productMin});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product_category'] != null) {
      productCategory = <Data_Product_Types>[];
      json['product_category'].forEach((v) {
        productCategory!.add(new Data_Product_Types.fromJson(v));
      });
    }
    productMax = json['product_max'];
    productMin = json['product_min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productCategory != null) {
      data['product_category'] =
          this.productCategory!.map((v) => v.toJson()).toList();
    }
    data['product_max'] = this.productMax;
    data['product_min'] = this.productMin;
    return data;
  }
}

class Data_Product_Types {
  int? id;
  String? title;
  String? description;
  String? status;
  int? order;
  int? iLft;
  int? iRgt;
  Null parentId;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  int? productCount;

  Data_Product_Types(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.productCount});

  Data_Product_Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['order'] = this.order;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['product_count'] = this.productCount;

    return data;
  }
  
}

Future<List<Data_Product_Types>> fetch_product_cat() async {
  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/product/categories'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['product_category'];
  // var ee = jsonResponse['data']['product_category'].toString();
  //String x = ee + '555';
  //print(x);
  List<String> testList = [];

  for (var i = 0; i < jsonCon.length; i++) {
    var ee = jsonResponse['data']['product_category'][i]['title'].toString();
    testList.add(ee);
  }
  print(testList);

  if (response.statusCode == 200) {
    return jsonCon.map((data) => Data_Product_Types.fromJson(data)).toList();
  } else {
    throw Exception("error");
  }
}

void main(List<String> args) {
  fetch_product_cat();
}
