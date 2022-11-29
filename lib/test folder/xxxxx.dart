import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/animals_API.dart';
import 'package:zeleex_application/address_edit.dart';

import '../API/Post Method/google_login_api.dart';

// Future<void> postCart(String token) async {
//   var bigdata = {};
//   var toAddData = [];
//   var internalData = {};
//   var cart_toAddData = [];
//   var cart_internalData = {};

//   bigdata["user_address_id"] = 1;
//   bigdata["temp_address_name"] = 'Chawanthon Wira';
//   bigdata["temp_address_city"] = "Korat";
//   bigdata["temp_address_district"] = "Mueng";
//   bigdata["temp_address_province"] = 'KKU';
//   bigdata["temp_address_postcode"] = '30045';
//   bigdata["payment_method"] = 'plai-tang';
//   bigdata["status"] = 'created';

//   bigdata["total_discount"] = 0;
//   bigdata["total_amount"] = 9;
//   bigdata["total"] = 250;
//   bigdata["shipping_cost"] = 40;

//   for (int storeLoop = 0; storeLoop < ['data']['store'].length; storeLoop++) {

//     internalData = {};
//     internalData["store_id"] = ['data']['store'][storeLoop]['store_id'];

//     for (var cartLoop = 0; cartLoop < ['data']['store'][storeLoop]['product_skus'].length; cartLoop++) {

//       cart_internalData = {};
//       if (cartLoop < storeLoop) {

//       } else {
//         cart_internalData["id"] =
//             ['data']['store'][storeLoop]['product_skus'][cartLoop]['cart_id'];
//       }

//       cart_toAddData.add(cart_internalData);
//     }
//     internalData["carts"] = cart_toAddData;

//     internalData["discount_id"] = 5;
//     internalData["discount"] = 5;
//     internalData["total"] = 5;
//     internalData["total_amount"] = 5;
//     internalData["shipping_id"] = 5;
//     internalData["shipping_cost"] = 5;
//     toAddData.add(internalData);
//   }

//   bigdata["data"] = toAddData;

//   String urlPost = "https://admin.zeleex.com/api/checkout";

//   final response = await http.post(
//     Uri.parse(urlPost),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     },
//     body: jsonEncode(bigdata),
//   );

//   if (response.statusCode == 200) {
//     print(response.body);
//     print(jsonEncode(bigdata));
//   } else {
//     print('error');
//   }
// }

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
  bigdata["status"] = 'created';

  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 9;
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

    for (var x = 0; x < count_CartinStore.length; x++) {
      cartData = {};

      cartData["id"] = count_CartinStore[x]['cart_id'].toString();

      print(jsonResponse['data']['store'][i]['product_skus'][x]['id']);
      print('ร้านที่: ' +
          count_Store[i]['id'].toString() +
          '    รหัส: ' +
          count_CartinStore[x]['cart_id'].toString());

      toAdd_cartData.add(cartData);
    }

    storeData["carts"] = toAdd_cartData;
    toAdd_storeData.add(storeData);
  }

  var x = bigdata.toString();
  bigdata["data"] = toAdd_storeData;

  print(jsonEncode(bigdata));
}


void main(List<String> args) {
  fetch_cart_list('1876|1c1bAmXEmPft5tSz6E6NZNICH4O5TC22xaC0hXO2');
}
