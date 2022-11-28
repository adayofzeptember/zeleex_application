import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/address_edit.dart';

Future<void> postCart(String token) async {
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
  bigdata["temp_address_postcode"] = '30045';
  bigdata["payment_method"] = 'plai-tang';
  bigdata["status"] = 'created';




  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 9;
  bigdata["total"] = 250;
  bigdata["shipping_cost"] = 40;

  for (int i = 0; i < 3; i++) {
    internalData = {};

    internalData["store_id"] = i;

    for (var ix = 0; ix < 1; ix++) {
      cart_internalData = {};
      if (ix < i) {
        break;
      } else {
        cart_internalData["id"] = ix; //[data][ix][0]
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

  String urlPost = "https://admin.zeleex.com/api/checkout";

  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(bigdata),
  );

  if (response.statusCode == 200) {
    print(response.body);
    print(jsonEncode(bigdata));
  } else {
    print('error');
  }
}

Future<void> fetch_cart_list(String token) async {
  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/cart/list'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'applicationjson',
    'Authorization': 'Bearer $token',
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
}

void main(List<String> args) {
  postCart('1876|1c1bAmXEmPft5tSz6E6NZNICH4O5TC22xaC0hXO2');
  //fetch_cart_list('1876|1c1bAmXEmPft5tSz6E6NZNICH4O5TC22xaC0hXO2');
}
