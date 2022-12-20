import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/main%206%20pages/onlyMenuForMainPage_nothing_here.dart';
import 'package:zeleex_application/second.dart';
import 'package:zeleex_application/test%20folder/device_info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(First_Page()));
}

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ((context, child) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(900, name: MOBILE),
              const ResponsiveBreakpoint.resize(1000, name: MOBILE),
              const ResponsiveBreakpoint.resize(1200, name: TABLET),
            ],
          )),
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.kToDark,
        appBarTheme: AppBarTheme(color: Palette.kToDark),
      ),
      home: MainAndIcon(),
    );
  }
}

class MainAndIcon extends StatefulWidget {
  MainAndIcon({Key? key}) : super(key: key);
  @override
  State<MainAndIcon> createState() => _MainAndIconState();
}

class _MainAndIconState extends State<MainAndIcon> {
  @override
  initState() {
    _Load_AndGo();
    super.initState();
  }

  Future _Load_AndGo() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();

    var checkToken = prefs2.get('keyToken');

    if (checkToken.toString() != 'null') {
      print(" --------------> stored token: " + checkToken.toString());
    } else {
      print(" --------------> no token");
    }
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Frame.png',
            ),
          ],
        ),
      ),
    );
  }
}
