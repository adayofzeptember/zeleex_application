import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Post%20Method/post_Register.dart';
import 'package:zeleex_application/API/Read%20All/animals_API.dart';
import 'package:zeleex_application/main.dart';
import 'package:zeleex_application/payment.dart';

class Cart_ReadList {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Cart_Individual_Data? data;

  Cart_ReadList(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Cart_ReadList.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new Cart_Individual_Data.fromJson(json['data'])
        : null;
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

class Cart_Individual_Data {
  User? user;
  List<Store>? store;
  int? productAll;

  Cart_Individual_Data({this.user, this.store, this.productAll});

  Cart_Individual_Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['store'] != null) {
      store = <Store>[];
      json['store'].forEach((v) {
        store!.add(new Store.fromJson(v));
      });
    }
    productAll = json['product_all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.map((v) => v.toJson()).toList();
    }
    data['product_all'] = this.productAll;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? avatar;
  String? provider;
  String? providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? imageProfile;
  int? storeCheck;

  User(
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
      this.deletedAt,
      this.imageProfile,
      this.storeCheck});

  User.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deleted_at'];
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
    data['deleted_at'] = this.deletedAt;
    data['image_profile'] = this.imageProfile;
    data['store_check'] = this.storeCheck;
    return data;
  }
}

class Store {
  int? id;
  String? title;
  List<ProductSkus>? productSkus;
  int? priceTatal;
  //-- shipping อยูู่ในนี้
  int? productSkusCount;
  Image_Cart? image;
  Image_Cart? imageCover;
  int? productCount;
  int? animalCount;
  int? blogCount;
  int? subscribeCount;

  Store(
      {this.id,
      this.title,
      this.productSkus,
      this.priceTatal,
      this.productSkusCount,
      this.image,
      this.imageCover,
      this.productCount,
      this.animalCount,
      this.blogCount,
      this.subscribeCount});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['product_skus'] != null) {
      productSkus = <ProductSkus>[];
      json['product_skus'].forEach((v) {
        productSkus!.add(new ProductSkus.fromJson(v));
      });
    }
    priceTatal = json['price_tatal'];
    productSkusCount = json['product_skus_count'];
    image =
        json['image'] != null ? new Image_Cart.fromJson(json['image']) : null;
    imageCover = json['image_cover'] != null
        ? new Image_Cart.fromJson(json['image_cover'])
        : null;
    productCount = json['product_count'];
    animalCount = json['animal_count'];
    blogCount = json['blog_count'];
    subscribeCount = json['subscribe_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.productSkus != null) {
      data['product_skus'] = this.productSkus!.map((v) => v.toJson()).toList();
    }
    data['price_tatal'] = this.priceTatal;
    data['product_skus_count'] = this.productSkusCount;
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
    return data;
  }
}

class ProductSkus {
  int? id;
  int? productId;
  String? name;
  int? price;
  int? order;
  int? stock;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? unit;
  int? cartId;
  Product_Cart? product;

  ProductSkus(
      {this.id,
      this.productId,
      this.name,
      this.price,
      this.order,
      this.stock,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.unit,
      this.cartId,
      this.product});

  ProductSkus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    price = json['price'];
    order = json['order'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    unit = json['unit'];
    cartId = json['cart_id'];
    product = json['product'] != null
        ? new Product_Cart.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['order'] = this.order;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['unit'] = this.unit;
    data['cart_id'] = this.cartId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product_Cart {
  int? id;
  String? title;
  Image_Cart? image;
  List<Images>? images;
  int? favoriteCount;
  int? reviewCount;
  int? price;

  Product_Cart(
      {this.id,
      this.title,
      this.image,
      this.images,
      this.favoriteCount,
      this.reviewCount,
      this.price});

  Product_Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image =
        json['image'] != null ? new Image_Cart.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['favorite_count'] = this.favoriteCount;
    data['review_count'] = this.reviewCount;
    data['price'] = this.price;
    return data;
  }
}

class Image_Cart {
  String? main;
  String? thumbnail;
  Image_Cart({this.main, this.thumbnail});

  Image_Cart.fromJson(Map<String, dynamic> json) {
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

Future<List<ProductSkus>> fetch_cartSku(
    String userID, String userToken, int x) async {
  final response = await http.get(
      Uri.parse(
          'https://api.zeleex.com/api/cart/list?user_id=' + userID.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken',
      });

  final jsonResponse = json.decode(response.body) as Map<dynamic, dynamic>;
  //var jsonConTest = jsonResponse['data']['store'][0];
  //var x = jsonResponse['data']['product_all'];
  List jsonCon = jsonResponse['data']['store'][x]['product_skus'];

  if (response.statusCode == 200) {
    return jsonCon.map((data) => ProductSkus.fromJson(data)).toList();
  } else {
    throw Exception('error response =! 200');
  }
}

//!-----------------------------------------------------------------------------------
Future<List<Store>> fetch_cartList2(String userToken222) async {
  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/cart/list'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'applicationjson',
    'Authorization': 'Bearer $userToken222',
  });

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['store']; //?ได้แล้วมี 2
  List jsonCon2 = jsonResponse['data']['store'][0]['product_skus'];
  var jsonCon3 = jsonResponse['data']['store'][1]['product_skus'][0]['cart_id'];
  List<String> testList = [];
  int total = 0;
  var productAll = jsonResponse['data']['product_all'].toString();
  var shippinPrice = jsonResponse['data']['store'][0]['shipping'][0]['rate'][0]
          ['price']
      .toString();

  for (var loop = 0; loop < jsonCon.length; loop++) {
    String cart555 = jsonResponse['data']['store'][loop]['product_skus'][0]
            ['cart_id']
        .toString(); //วนcart_id

    testList.add(cart555);
    // int eachStore_totalPrice =
    //     jsonResponse['data']['store'][loop]['price_tatal'];
    // int parsed_total = eachStore_totalPrice;
    // total = total + parsed_total;
    // print(eachStore_totalPrice.toString());      วนหาราคารวม
  }
  print(jsonEncode(testList));

  if (response.statusCode == 200) {
    return jsonCon.map((data) => Store.fromJson(data)).toList();
  } else {
    print('error');
    throw Exception('error response status');
  }
}

//!-----------------------------------------------------------------------------------
void main(List<String> args) {
  fetch_cartList2('1876|1c1bAmXEmPft5tSz6E6NZNICH4O5TC22xaC0hXO2');
}
