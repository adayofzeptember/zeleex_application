import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/main_page.dart';
import 'package:zeleex_application/second.dart';

void main() {
  runApp(
    const First_Page(),
  );
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
      home: main_Icon(),
    );
  }
}

class main_Icon extends StatefulWidget {
  main_Icon({Key? key}) : super(key: key);

  @override
  State<main_Icon> createState() => _main_IconState();
}

class _main_IconState extends State<main_Icon> {
  @override
  initState() {
    super.initState();
    LoadAndGo();
  }

  Future<void> LoadAndGo() async {
    await Future.delayed(const Duration(seconds: 2), () {
      print("object");
      Navigator.push(
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset('assets/images/newLogo.svg', width: 300, height: 300, fit: BoxFit.cover, color: Palette.kToDark,)
              Image.asset('assets/images/Frame.png',
                  // width: 300,
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
