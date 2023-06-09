import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/bloc/address%20management/model.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/bloc/profile/profile_bloc.dart';
import 'package:zeleex_application/from%20Profile/profile.dart';
import 'package:zeleex_application/main.dart';
import '../../API/Post Method/address_add_and_edit.dart';
import '../../Others/Plate.dart';
import '../../Others/url.dart';
import '../../Screens/Address Pages/address_edit_page.dart';
import '../../Screens/Address Pages/address_main_page.dart';
import 'model.dart';
import 'model.dart';
part 'address_management_event.dart';
part 'address_management_state.dart';

class AddressManagementBloc
    extends Bloc<AddressManagementEvent, AddressManagementState> {
  final dio = Dio();
  AddressManagementBloc()
      : super(AddressManagementState(
            loading: true,
            edit_address_data: '',
            address_switch: false,
            ifDeafult: 0,
            address_data: [])) {
    //!------------------------------------------------------
    on<Load_Address>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + 'address/shipping',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );

        var fetched_address = (state.address_data != []) ? state.address_data : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']) {
            fetched_address.add(
              Address_Model(
                id: await nested['id'].toString(),
                address: await nested['address'].toString(),
                province: await nested['province'].toString(),
                defaultStatus: nested['default'].toString(),
                postcode: await nested['postcode'].toString(),
                phone: await nested['phone'].toString(),
                name: await nested['name'].toString(),
                district: await nested['district'].toString(),
                city: await nested['city'].toString(),
              ),
            );
          }

          emit(state.copyWith(
            address_data: fetched_address,
          ));
        } else {
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });
    //!------------------------------------------------------
    on<EditLoad_Address>((event, emit) async {
      Navigator.push(
        event.context,
        PageTransition(
          duration: const Duration(milliseconds: 250),
          type: PageTransitionType.fade,
          child: Address_Edit_Page(),
        ),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      emit(state.copyWith(
        loading: true,
      ));
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "address/shipping-edit/${event.edit_addressID}",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );
        dynamic dataEdit =
            (state.edit_address_data != '') ? state.edit_address_data : '';
        dynamic nested = response.data['data'];

        if (response.statusCode == 200) {
          emit(state.copyWith(
            loading: false,
          ));

          dataEdit = EditAddress_Model(
            id: await nested['id'].toString(),
            address: await nested['address'].toString(),
            province: await nested['province'].toString(),
            defaultStatus: (nested['default'].toString() == '1' ? true : false),
            postcode: await nested['postcode'].toString(),
            phone: await nested['phone'].toString(),
            name: await nested['name'].toString(),
            district: await nested['district'].toString(),
            city: await nested['city'].toString(),
          );

          emit(state.copyWith(
            edit_address_data: dataEdit,
          ));
        } else {
          emit(state.copyWith(
            loading: false,
          ));
          print('-----------fail api');
          print(response);
        }
      } catch (e) {
        emit(state.copyWith(
          loading: false,
        ));
        print('----------- fail try');

        print("Exception $e");
      }
    });
    //!------------------------------------------------------
    on<TapSwitchAddress>((event, emit) {
      emit(state.copyWith(address_switch: event.getBooleanSwitch));

      if (state.address_switch == true) {
        emit(state.copyWith(ifDeafult: 1));
      } else {
        emit(state.copyWith(ifDeafult: 0));
      }
    });

    //!------------------------------------------------------
    on<DeleteAddress>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');
      var user_id = prefs2.get('keyID');

      try {
        final response = await dio.delete(
          zeelexAPI_URL_admin + "address/shipping-delete/${event.addressID}",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
              "Authorization": "Bearer $user_token",
            },
          ),
        );
        print(response);
        if (response.data['responseStatus'].toString() == "true") {
          Fluttertoast.showToast(
              msg: "ลบที่อยู่แล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 235, 235, 235),
              textColor: ZeleexColor.zeleexGreen,
              fontSize: 15);
          add(Load_Address());
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception: $e");
      }
    });
    //!------------------------------------------------------
    on<AddNew_Address>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');
      var user_id = prefs2.get('keyID');
      var body_AddAddress = json.encode(event.address_request.toJson());

      try {
        final response =
            await dio.post(zeelexAPI_URL_admin + "address/shipping-store",
                options: Options(
                  headers: {
                    "Content-Type": "application/json",
                    'Accept': 'application/json',
                    "Authorization": "Bearer $user_token",
                  },
                ),
                data: body_AddAddress);
        print(response);
        if (response.data['responseStatus'].toString() == "true") {
          add(Load_Address());
          Fluttertoast.showToast(
              msg: "เพิ่มที่อยู่ใหม่แล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 235, 235, 235),
              textColor: ZeleexColor.zeleexGreen,
              fontSize: 15);
   

          Navigator.pop(event.context);
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception: $e");
      }
    });

    //*
    on<Update_Address>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');
      var user_id = prefs2.get('keyID');
      var body_AddAddress = json.encode(event.address_request.toJson());

      try {
        final response = await dio.post(
            zeelexAPI_URL_admin + "address/shipping-update/${event.getID}",
            options: Options(
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                "Authorization": "Bearer $user_token",
              },
            ),
            data: body_AddAddress);
        print(response);
        if (response.data['responseStatus'].toString() == "true") {
          add(Load_Address());
          Fluttertoast.showToast(
              msg: "แก้ไขที่อยู่แล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 235, 235, 235),
              textColor: ZeleexColor.zeleexGreen,
              fontSize: 15);

          Navigator.pop(event.context);
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception: $e");
      }
    });
  }
}
