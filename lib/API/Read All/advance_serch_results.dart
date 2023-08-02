import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Search_Results {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  List<Data_Search_Result>? data;

  Search_Results(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Search_Results.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Search_Result>[];
      json['data'].forEach((v) {
        data!.add(new Data_Search_Result.fromJson(v));
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

class Data_Search_Result {
  int? id;
  String? title;
  String? description;
  String? content;
  String? status;
  String? seoTitle;
  String? seoDescription;
  int? reads;
  int? storeId;
  int? brandId;
  String? conditionType;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  String? width;
  String? height;
  String? length;
  String? weight;
  Imagex? image;
  List<Images>? images;
  int? favoriteCount;
  int? reviewCount;

  Data_Search_Result(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.status,
      this.seoTitle,
      this.seoDescription,
      this.reads,
      this.storeId,
      this.brandId,
      this.conditionType,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.width,
      this.height,
      this.length,
      this.weight,
      this.image,
      this.images,
      this.favoriteCount,
      this.reviewCount});

  Data_Search_Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    status = json['status'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    reads = json['reads'];
    storeId = json['store_id'];
    brandId = json['brand_id'];
    conditionType = json['condition_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    weight = json['weight'];
    image = json['image'] != null ? new Imagex.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
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
    data['store_id'] = this.storeId;
    data['brand_id'] = this.brandId;
    data['condition_type'] = this.conditionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    data['weight'] = this.weight;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['favorite_count'] = this.favoriteCount;
    data['review_count'] = this.reviewCount;
    return data;
  }
}

class Imagex {
  String? main;
  String? thumbnail;

  Imagex({this.main, this.thumbnail});

  Imagex.fromJson(Map<String, dynamic> json) {
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

class Images {
  String? title;
  String? main;
  String? thumbnail;

  Images({this.title, this.main, this.thumbnail});

  Images.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    main = json['main'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['main'] = this.main;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}



Future<List<Data_Search_Result>> fetch_search_results(String keyword) async {
  final response = await http.get(Uri.parse(
      'https://admin.zeleex.com/api/search/products?title=' +
          keyword.toString()));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'];

  if (response.statusCode == 200) {
    return jsonCon.map((data) => Data_Search_Result.fromJson(data)).toList();
  } else {
    throw Exception("error");
  }
}

void main(List<String> args) {
  fetch_search_results('enim a');
}