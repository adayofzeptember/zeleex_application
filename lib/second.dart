import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/login.dart';
import 'dart:io';
import 'Plate.dart';
import 'main_page.dart';

//MediaQuery.of(context).size.height * 0.25

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

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Palette.kToDark,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "หน้าหลัก ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage2()));
                  }, // Handle your callback
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Palette.kToDark,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "ล็อคอิน (ไว้ทดสอบไปส่วนเข้าสู่ระบบ)",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
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
