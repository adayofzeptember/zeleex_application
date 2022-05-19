import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import 'package:zeleex_application/second.dart';
import 'package:zeleex_application/test%20folder/device_info.dart';

//หน้าเปิดแอป
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(First_Page()));

  // runApp(const First_Page());
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
    //onResume
    super.initState();
    
    
    Load_AndGo();
   
  }

  Future<void> Load_AndGo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      var x = "the power of the sun, in the palm of my hand.";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(
            name: x,
          ),
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
