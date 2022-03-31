import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/second.dart';

void main() {
  runApp(const First_Page());
}



class First_Page extends StatelessWidget {
  
  const First_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Palette.kToDark),
      home: main_Icon(),
    );
  }
  
}

class main_Icon extends StatelessWidget {
  const main_Icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ),
          );
        },
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset('assets/images/newLogo.svg', width: 300, height: 300, fit: BoxFit.cover, color: Palette.kToDark,)
                Image.asset('assets/images/Frame.png',
                    // width: 300,
                    height: 300,
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }
}