import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zeleex_application/API/url.dart';
import '../Read By ID/animal_id_API.dart';

class Order_Wait {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;

  List<Data_Order_ToPay>? data;

  Order_Wait(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Order_Wait.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    if (json['data'] != null) {
      data = <Data_Order_ToPay>[];
      json['data'].forEach((v) {
        data!.add(Data_Order_ToPay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class Data_Order_ToPay {
  int? id;
  int? userAddressId;
  Null? userAddressTaxId;
  String? tempAddressName;
  String? tempAddressCity;
  String? tempAddressDistrict;
  String? tempAddressProvince;
  String? tempAddressPostcode;
  String? tempUserAddressTax;
  int? userId;
  int? storeId;
  String? status;
  String? tempUser;
  String? totalDiscount;
  String? paymentMethod;
  String? totalAmount;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? total;
  String? shippingCost;
  int? shippingId;
  Null? trackingId;
  int? orderGroupId;
  Null? withdrawId;
  String? discountId;
  bool? review;
  Address? address;
  Null? addressTax;
  Stores? stores;
  Shipping? shipping;
  List<OrderItem>? orderItem;

  Data_Order_ToPay(
      {this.id,
      this.userAddressId,
      this.userAddressTaxId,
      this.tempAddressName,
      this.tempAddressCity,
      this.tempAddressDistrict,
      this.tempAddressProvince,
      this.tempAddressPostcode,
      this.tempUserAddressTax,
      this.userId,
      this.storeId,
      this.status,
      this.tempUser,
      this.totalDiscount,
      this.paymentMethod,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.total,
      this.shippingCost,
      this.shippingId,
      this.trackingId,
      this.orderGroupId,
      this.withdrawId,
      this.discountId,
      this.review,
      this.address,
      this.addressTax,
      this.stores,
      this.shipping,
      this.orderItem});

  Data_Order_ToPay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAddressId = json['user_address_id'];
    userAddressTaxId = json['user_address_tax_id'];
    tempAddressName = json['temp_address_name'];
    tempAddressCity = json['temp_address_city'];
    tempAddressDistrict = json['temp_address_district'];
    tempAddressProvince = json['temp_address_province'];
    tempAddressPostcode = json['temp_address_postcode'];
    tempUserAddressTax = json['temp_user_address_tax'];
    userId = json['user_id'];
    storeId = json['store_id'];
    status = json['status'];
    tempUser = json['temp_user'];
    totalDiscount = json['total_discount'];
    paymentMethod = json['payment_method'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    total = json['total'];
    shippingCost = json['shipping_cost'];
    shippingId = json['shipping_id'];
    trackingId = json['tracking_id'];
    orderGroupId = json['order_group_id'];
    withdrawId = json['withdraw_id'];
    discountId = json['discount_id'];
    review = json['review'];

    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    addressTax = json['address_tax'];
    stores = json['stores'] != null ? Stores.fromJson(json['stores']) : null;
    shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    if (json['order_item'] != null) {
      orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        orderItem!.add(OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_address_id'] = this.userAddressId;
    data['user_address_tax_id'] = this.userAddressTaxId;
    data['temp_address_name'] = this.tempAddressName;
    data['temp_address_city'] = this.tempAddressCity;
    data['temp_address_district'] = this.tempAddressDistrict;
    data['temp_address_province'] = this.tempAddressProvince;
    data['temp_address_postcode'] = this.tempAddressPostcode;
    data['temp_user_address_tax'] = this.tempUserAddressTax;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['status'] = this.status;

    data['temp_user'] = this.tempUser;
    data['total_discount'] = this.totalDiscount;
    data['payment_method'] = this.paymentMethod;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['total'] = this.total;
    data['shipping_cost'] = this.shippingCost;
    data['shipping_id'] = this.shippingId;
    data['tracking_id'] = this.trackingId;
    data['order_group_id'] = this.orderGroupId;
    data['withdraw_id'] = this.withdrawId;
    data['discount_id'] = this.discountId;
    data['review'] = this.review;

    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['address_tax'] = this.addressTax;
    if (this.stores != null) {
      data['stores'] = this.stores!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.orderItem != null) {
      data['order_item'] = this.orderItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? phone;
  int? default1;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Address(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.phone,
      this.default1,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    phone = json['phone'];
    default1 = json['default1'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['default1'] = this.default1;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Stores {
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
  Null? deletedAt;
  int? shippingId;
  int? productCount;
  int? animalCount;
  int? blogCount;
  int? subscribeCount;

  Stores(
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
      this.deletedAt,
      this.shippingId,
      this.productCount,
      this.animalCount,
      this.blogCount,
      this.subscribeCount});

  Stores.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deleted_at'];
    shippingId = json['shipping_id'];

    productCount = json['product_count'];
    animalCount = json['animal_count'];
    blogCount = json['blog_count'];
    subscribeCount = json['subscribe_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title'] = this.deletedAt;
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

    data['deleted_at'] = this.deletedAt;
    data['shipping_id'] = this.shippingId;
    data['product_count'] = this.productCount;
    data['animal_count'] = this.animalCount;
    data['blog_count'] = this.blogCount;
    data['subscribe_count'] = this.subscribeCount;
    return data;
  }
}

class Imagee {
  String? main;
  String? thumbnail;

  Imagee({this.main, this.thumbnail});

  Imagee.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['main'] = this.main;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Shipping {
  int? id;
  String? name;

  Shipping({this.id, this.name});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class OrderItem {
  int? id;
  int? orderId;
  int? productSkuId;
  String? tempProductName;
  String? productDiscount;
  String? productAmounts;
  String? unit;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? reviewId;
  Sku? sku;
  Null? review;

  OrderItem(
      {this.id,
      this.orderId,
      this.productSkuId,
      this.tempProductName,
      this.productDiscount,
      this.productAmounts,
      this.unit,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.reviewId,
      this.sku,
      this.review});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productSkuId = json['product_sku_id'];
    tempProductName = json['temp_product_name'];
    productDiscount = json['product_discount'];
    productAmounts = json['product_amounts'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    reviewId = json['review_id'];
    sku = json['sku'] != null ? Sku.fromJson(json['sku']) : null;
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_sku_id'] = this.productSkuId;
    data['temp_product_name'] = this.tempProductName;
    data['product_discount'] = this.productDiscount;
    data['product_amounts'] = this.productAmounts;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['review_id'] = this.reviewId;
    if (this.sku != null) {
      data['sku'] = this.sku!.toJson();
    }
    data['review'] = this.review;
    return data;
  }
}

class Sku {
  int? id;
  int? productId;
  String? name;
  int? price;
  int? order;
  int? stock;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? afterPrice;
  Product? product;

  Sku(
      {this.id,
      this.productId,
      this.name,
      this.price,
      this.order,
      this.stock,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.afterPrice,
      this.product});

  Sku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    price = json['price'];
    order = json['order'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    afterPrice = json['after_price'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['order'] = this.order;
    data['stock'] = this.stock;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['after_price'] = this.afterPrice;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  String? content;
  String? status;
  String? seoTitle;
  String? seoDescription;
  int? reads;
  int? storeId;
  Null? brandId;
  String? conditionType;
  String? createdAt;
  String? updatedAt;

  String? width;

  String? height;
  String? length;
  String? weight;
  Imagee? image;
  int? favoriteCount;
  int? reviewCount;

  Product(
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
      this.width,
      this.height,
      this.length,
      this.weight,
      this.image,
      this.favoriteCount,
      this.reviewCount});

  Product.fromJson(Map<String, dynamic> json) {
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

    width = json['width'];
    height = json['height'];
    length = json['length'];
    weight = json['weight'];
    image = json['image'] != null ? new Imagee.fromJson(json['image']) : null;
    //*-------------------------
    brandId = json['brainID'];

    //*-------------------------
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    data['weight'] = this.weight;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['favorite_count'] = this.favoriteCount;
    data['review_count'] = this.reviewCount;
    return data;
  }
}

Future<List<OrderItem>> fetch_Order_Topay(String userToken) async {
  final response =
      await http.get(Uri.parse(zeelexAPI_URL_admin + 'orders'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $userToken',
  });

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data'][0]['order_item'];
  // var x = jsonResponse['data'][0]['users']['id'].toString();
  // var item = jsonResponse['data'][0]['order_item'][0]['sku']['name'].toString();
  print(jsonCon);
  //print(item);
  if (response.statusCode == 200) {
    //print(jsonConSpecific);

    return jsonCon.map((data) => new OrderItem.fromJson(data)).toList();
  } else {
    throw Exception("error...");
  }
}

void main(List<String> args) {
  fetch_Order_Topay('1891|bw9t9hPicOAQwjdyXIRLosdUbmC0EGu4hhzuDrwU');
}
