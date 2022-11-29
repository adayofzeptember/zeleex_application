import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Cart_CheckOut {
  int? userAddressId;
  String? tempAddressName;
  String? tempAddressCity;
  String? tempAddressDistrict;
  String? tempAddressProvince;
  String? paymentMethod;
  int? tempAddressPostcode;
  String? status;
  int? totalDiscount;
  int? totalAmount;
  int? total;
  int? shippingCost;
  List<Cart_CheckOut_Store>? cart_data;

  Cart_CheckOut(
      {this.userAddressId,
      this.tempAddressName,
      this.tempAddressCity,
      this.tempAddressDistrict,
      this.tempAddressProvince,
      this.paymentMethod,
      this.tempAddressPostcode,
      this.status,
      this.totalDiscount,
      this.totalAmount,
      this.total,
      this.shippingCost,
      this.cart_data});

  Cart_CheckOut.fromJson(Map<String, dynamic> json) {
    userAddressId = json['user_address_id'];
    tempAddressName = json['temp_address_name'];
    tempAddressCity = json['temp_address_city'];
    tempAddressDistrict = json['temp_address_district'];
    tempAddressProvince = json['temp_address_province'];
    paymentMethod = json['payment_method'];
    tempAddressPostcode = json['temp_address_postcode'];
    status = json['status'];
    totalDiscount = json['total_discount'];
    totalAmount = json['total_amount'];
    total = json['total'];
    shippingCost = json['shipping_cost'];
    if (json['data'] != null) {
      cart_data = <Cart_CheckOut_Store>[];
      json['data'].forEach((v) {
        cart_data!.add(new Cart_CheckOut_Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_address_id'] = this.userAddressId;
    data['temp_address_name'] = this.tempAddressName;
    data['temp_address_city'] = this.tempAddressCity;
    data['temp_address_district'] = this.tempAddressDistrict;
    data['temp_address_province'] = this.tempAddressProvince;
    data['payment_method'] = this.paymentMethod;
    data['temp_address_postcode'] = this.tempAddressPostcode;
    data['status'] = this.status;
    data['total_discount'] = this.totalDiscount;
    data['total_amount'] = this.totalAmount;
    data['total'] = this.total;
    data['shipping_cost'] = this.shippingCost;
    if (this.cart_data != null) {
      data['data'] = this.cart_data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
}

class Cart_CheckOut_Store {
  int? storeId;
  List<Carts>? in_carts;
  int? discountId;
  int? discount;
  int? total;
  int? totalAmount;
  int? shippingId;
  
  int? shippingCost;

  Cart_CheckOut_Store(
      {this.storeId,
      this.in_carts,
      this.discountId,
      this.discount,
      this.total,
      this.totalAmount,
      this.shippingId,
      this.shippingCost});

  Cart_CheckOut_Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    if (json['carts'] != null) {
      in_carts = <Carts>[];
      json['carts'].forEach((v) {
        in_carts!.add(new Carts.fromJson(v));
      });
    }
    discountId = json['discount_id'];
    discount = json['discount'];
    total = json['total'];
    totalAmount = json['total_amount'];
    shippingId = json['shipping_id'];
    shippingCost = json['shipping_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    if (this.in_carts != null) {
      data['carts'] = this.in_carts!.map((v) => v.toJson()).toList();
    }
    data['discount_id'] = this.discountId;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['total_amount'] = this.totalAmount;
    data['shipping_id'] = this.shippingId;
    data['shipping_cost'] = this.shippingCost;
    return data;
  }
}

class Carts {
  int? id;

  Carts({this.id});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

//!-------------------------------------------------------------------------------------------------

void postCart() {
  var bigdata = {};
  var toAddData = [];
  var internalData = {};

  var cart_toAddData = [];
  var cart_internalData = {};

  bigdata["user_address_id"] = 1;
  bigdata["temp_address_name"] = 'Chawanthon Wira';
  bigdata["temp_address_city"] = "Korat";
  bigdata["temp_address_district"] = "Mueng";
  bigdata["temp_address_province"] = 'KKU';
  bigdata["payment_method"] = 'plai-tang';
  bigdata["temp_address_postcode"] = '30045';
  bigdata["status"] = 'created';
  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 9;
  bigdata["total"] = 250;
  bigdata["shipping_cost"] = 40;

  for (int i = 0; i < 3; i++) { //ลูปใหญ่
    internalData = {};

    internalData["store_id"] = i;

    for (var ix = 0; ix < 1; ix++) {
      cart_internalData = {};
      if (ix < i) {
        break;
      } else {
        cart_internalData["id"] = ix;
      }

      cart_toAddData.add(cart_internalData);
    }
    internalData["carts"] = cart_toAddData;
  

    internalData["discount_id"] = 5;
    internalData["discount"] = 5;
    internalData["total"] = 5;
    internalData["total_amount"] = 5;
    internalData["shipping_id"] = 5;
    internalData["shipping_cost"] = 5;
    toAddData.add(internalData);
  }

  bigdata["data"] = toAddData;

  print(jsonEncode(bigdata));
}

