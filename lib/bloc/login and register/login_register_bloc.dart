// ignore_for_file: unused_local_variable
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/bottomMenu_main_page.dart';
part 'login_register_event.dart';
part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  final dio = Dio();
  LoginRegisterBloc() : super(LoginRegisterState(loading: false)) {
    //*----------------------------------------------------------------------------------
    on<Login_Casual>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response = await dio.post(zeelexAPI_URL_admin + "login",
            options: Options(
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
            ),
            data: json.encode({
              "email": event.getEmail,
              "password": event.getPassword,
            }));

        emit(state.copyWith(loading: false));

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('keyToken', response.data['data']['token'].toString());
        prefs.setString('keyID', response.data['data']['id'].toString());
        print(response.data['data']['token']);
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BottomMenu_Page(),
          ),
        );

        // if (response.statusCode == 200 || response.statusCode == 400) {
        //   print(response.data['data']['token']);
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //   prefs.setString(
        //       'keyToken', response.data['data']['token'].toString());
        //   prefs.setString('keyID', response.data['data']['id'].toString());
        // } else {}
      } catch (e) {
        emit(state.copyWith(loading: false));
        Fluttertoast.showToast(
            msg:
                "ไม่พบบัญชีผู้ใช้ในระบบ, สมัครบัญชีใหม่หรือตรวจสอบอีเมลและรหัสผ่านอีกครั้ง \n ${e.toString()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
      }
    });
    //?----------------------------------------------------------------------------------
    on<Register_Casual>((event, emit) async {
      emit(state.copyWith(loading: true));
      final response = await http.post(
        Uri.parse(zeelexAPI_URL_admin + "register"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          "name": event.getRegisterName + " " + event.getRegisterSurename,
          "email": event.getRegisterEmail,
          "password": event.getRegisterPassword1,
          "password_confirmation": event.getRegisterPassword2,
          "policy_confirmation": event.getRegisterPolicy,
        }),
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(loading: false));
        var jsonRes = json.decode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('keyToken', jsonRes['data']['token'].toString());
        prefs.setString('keyID', jsonRes['data']['id'].toString());

        Fluttertoast.showToast(
            msg: "สมัครบัญชีใหม่เสร็จสิ้น",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BottomMenu_Page(),
          ),
        );
      } else {
        emit(state.copyWith(loading: false));
        Fluttertoast.showToast(
            msg: "${response.body}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
      }
    });
  }
}
