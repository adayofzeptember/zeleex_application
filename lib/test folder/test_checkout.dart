import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/animals_API.dart';
import 'package:zeleex_application/address_edit.dart';

import '../API/Post Method/google_login_api.dart';

Future<void> fetch_cart_list(String token) async {
  var bigdata = {};
  var toAdd_storeData = [];
  var storeData = {};
  var toAdd_cartData = [];
  var cartData = {};

  bigdata["user_address_id"] = 1;
  bigdata["temp_address_name"] = 'Chawanthon Wira';
  bigdata["temp_address_city"] = "Korat";
  bigdata["temp_address_district"] = "Mueng";
  bigdata["temp_address_province"] = 'KKU';
  bigdata["temp_address_postcode"] = '30045';
  bigdata["payment_method"] = 'plai-tang';
  bigdata["status"] = "created";

  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 30;
  bigdata["total"] = 250;
  bigdata["shipping_cost"] = 40;

  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/cart/list'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'applicationjson',
    'Authorization': 'Bearer $token',
  });

  var jsonResponse = json.decode(response.body);

  List count_Store = jsonResponse['data']['store'];

  for (var i = 0; i < count_Store.length; i++) {
    storeData = {};

    storeData["store_id"] = count_Store[i]['id'].toString();

    List count_CartinStore = jsonResponse['data']['store'][i]['product_skus'];
//!----------------------------loop cart--------------------------------------------------------------
    for (var x = 0; x < count_CartinStore.length; x++) {
      cartData = {};
      toAdd_cartData = [];

      cartData["id"] =
          jsonResponse['data']['store'][i]['product_skus'][x]['cart_id'];

      //print(jsonResponse['data']['store'][i]['product_skus'][x]['cart_id']);
      print('ร้านที่: ' +
          count_Store[i]['id'].toString() +
          '    รหัส: ' +
          count_CartinStore[x]['cart_id'].toString());

      toAdd_cartData.add(cartData);
    }

    storeData["carts"] = toAdd_cartData;
//!-------------------------------------------------------------------------------------------------
    storeData["discount_id"] = 0;
    storeData["discount"] = 0;

    storeData["total"] = count_Store[i]['price_tatal'].toString();

    storeData["total_amount"] = 15;
    storeData["shipping_id"] = '';
    //count_Store[i]['shipping'][0]['id'].toString();
    storeData["shipping_cost"] = '';
    //count_Store[i]['shipping'][0]['rate'][0]['price'].toString();

    toAdd_storeData.add(storeData);
  }

  bigdata["data"] = toAdd_storeData;

  print(jsonEncode(bigdata));
}

void main(List<String> args) {
  fetch_cart_list('1884|1eEHkQOfgCNZ2jDUCmBhUUMhy4CI7VLKkbT4d2KR');
}
