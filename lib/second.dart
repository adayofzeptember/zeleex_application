import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/login.dart';
import 'dart:io';
import 'Plate.dart';
import 'main 6 pages/main_page.dart';

//MediaQuery.of(context).size.height * 0.25

class SecondPage extends StatefulWidget {
  String name = "";
  SecondPage({Key? key, required this.name}) : super(key: key);

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
              'assets/images/BG.png',
            ),
          )),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.51,
                ),
                // Image.asset('assets/images/Frame2.png',
                //     // width: 300,
                //     height: 100,
                //     fit: BoxFit.cover),
                SvgPicture.asset('assets/images/whiteLogo.svg'),
                SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('assets/images/welcome.svg'),
                // Image.asset('assets/images/welcome.png',
                //     // width: 300,
                //     fit: BoxFit.cover),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Palette.kToDark,
                      elevation: 0,
                      // side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) {
                      return Main_Page();
                    }));
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => Main_Page()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        // widget.name,
                        "หน้าหลัก",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     //Navigator.of(context, rootNavigator: true).pop(context);
                //     // Navigator.pop(context);
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (context) => Main_Page()));
                //   },
                //   child: Container(
                //     width: MediaQuery.of(context).size.width * 0.7,
                //     padding: EdgeInsets.all(15.0),
                //     decoration: BoxDecoration(
                //       color: Palette.kToDark,
                //       borderRadius: BorderRadius.circular(30.0),
                //     ),
                //     child: Text(
                //       "หน้าหลัก ",
                //       style: TextStyle(color: Colors.white, fontSize: 15),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Palette.kToDark,
                      elevation: 0,
                      // side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                    // Navigator.push(context,
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        "ทดสอบหน้าเข้าสู่ระบบ",
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
