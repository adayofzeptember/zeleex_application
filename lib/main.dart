import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
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
    super.initState();
    Load_AndGo();
  }


  Future<void> Load_AndGo() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var checkToken = prefs2.get('keyToken');
    if (checkToken.toString() != 'null') {
      print("--------------> stored token: " + checkToken.toString());
    } else {
      print("token is empty");
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
            Image.asset('assets/images/Frame.png',
                // height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
