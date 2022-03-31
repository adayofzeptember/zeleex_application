
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zeleex_application/login.dart';
import 'dart:io';
import 'Plate.dart';
import 'main_page.dart';

void main() {
  runApp(WelcomePage());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kanit'),
      home: SecondPage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: Container(
        
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
                height: 470,
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainPage(),
                    ),
                  );


                  
                }, // Handle your callback
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Palette.kToDark,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "หน้าหลัก",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage2()));
                }, // Handle your callback
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Palette.kToDark,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "ล็อคอิน",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}