import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/Others/url.dart';
part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  final dio = Dio();
  
  AddToCartBloc() : super(AddToCartState()) {
    on<Add_Product_toCart>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');
      var user_id = prefs2.get('keyID');

      try {
        final response = await dio.post(zeelexAPI_URL_admin + "cart/add",
            options: Options(
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                "Authorization": "Bearer $user_token",
              },
            ),
            data: json.encode({
              "user_id": user_id,
              "store_id": event.getStoreID,
              "product_sku_id": event.getPorductSkuID,
              "unit": event.getUnit,
            }));
        print(response);
        if (response.data['responseStatus'].toString() == "true") {
          Fluttertoast.showToast(
              msg: "เพิ่มสินค้าลงตะกร้าแล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 235, 235, 235),
              textColor: ZeleexColor.zeleexGreen,
              fontSize: 15);
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception: $e");
      }
    });
  }
}
