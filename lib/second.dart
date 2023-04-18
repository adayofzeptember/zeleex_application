import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/login.dart';
import 'dart:io';
import 'Others/Plate.dart';
import 'Main Pages/onlyMenuForMainPage_nothing_here.dart';
import 'package:device_info_plus/device_info_plus.dart';

//MediaQuery.of(context).size.height * 0.25

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/haha2.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.51,
                ),
                SvgPicture.asset('assets/images/whiteLogo.svg'),
                SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('assets/images/welcome.svg'),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ZeleexColor.zeleexGreen,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
