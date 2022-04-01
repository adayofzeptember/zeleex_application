import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/register.dart';
import 'Plate.dart';

void main(List<String> args) {
  runApp(LoginPage2());
}

class LoginPage2 extends StatelessWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage_widget(),
    );
  }
}

class LoginPage_widget extends StatefulWidget {
  LoginPage_widget({Key? key}) : super(key: key);
 

  @override
  State<LoginPage_widget> createState() => _LoginPage_widgetState();
}

class _LoginPage_widgetState extends State<LoginPage_widget> {
 
  
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Kanit', primarySwatch: Palette.kToDark),
        home: Scaffold(
            appBar: AppBar(
              //           systemOverlayStyle: SystemUiOverlayStyle(
              //   // Status bar color
              //   statusBarColor: Palette.kToDark,

              //   // Status bar brightness (optional)
              //   statusBarIconBrightness:
              //       Brightness.dark, // For Android (dark icons)
              //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
              // ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                    child: Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
              backgroundColor: Palette.kToDark,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Palette.kToDark,
                      //     borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(200),
                      //         bottomRight: Radius.circular(200)),
                      //   ),
                      //   height: 100,
                      // ),
                      CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(height: 100),
                      ),

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/images/left.svg',
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Text(
                                "เข้าสู่ระบบ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Text(
                                "dd",
                                style: TextStyle(
                                    color: Palette.kToDark,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail_outline),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 243, 238, 238),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      labelText: 'อีเมล',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_outline),
                                      // suffixIcon:
                                      //     Icon(Icons.remove_red_eye_sharp),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 243, 238, 238),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      labelText: 'รหัสผ่าน',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      "ลืมรหัสผ่าน?",
                                      style: TextStyle(
                                          color: Palette.kToDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Palette.kToDark,
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.red),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    onPressed: () {
                                      ;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "เข้าสู่ระบบ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side:
                                            BorderSide(color: Palette.kToDark),
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "สร้างบัญชีใหม่",
                                          style: TextStyle(
                                              color: Palette.kToDark,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),

                                  Row(children: <Widget>[
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 20.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 36,
                                          )),
                                    ),
                                    Text("หรือ"),
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 20.0, right: 10.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 36,
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        // side: BorderSide(color: Palette.kToDark),
                                        primary: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    onPressed: () {
                              
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // SizedBox(
                                              //   width: 10,
                                              // ),
                                              SvgPicture.asset(
                                                  'assets/images/fb.svg'),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "ดำเนินการต่อด้วย Facebook",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),

                                  // Container(
                                  //     width: double.infinity,
                                  //     padding: EdgeInsets.all(20.0),
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.blue,
                                  //       borderRadius: BorderRadius.circular(15.0),
                                  //     ),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       children: [
                                  //         // SizedBox(
                                  //         //   width: 10,
                                  //         // ),
                                  //         SvgPicture.asset(
                                  //             'assets/images/fb.svg'),
                                  //         SizedBox(
                                  //           width: 30,
                                  //         ),
                                  //         Text(
                                  //           "ดำเนินการต่อด้วย Facebook",
                                  //           style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 15),
                                  //         ),
                                  //       ],
                                  //     )),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 231, 231, 231)),
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // SizedBox(
                                              //   width: 10,
                                              // ),
                                              SvgPicture.asset(
                                                  'assets/images/gg.svg'),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "ดำเนินการต่อด้วยบัญชี Google",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontSize: 15),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),

                                  // Container(
                                  //     width: double.infinity,
                                  //     padding: EdgeInsets.all(20.0),
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //           color: Color.fromARGB(
                                  //               255, 238, 230, 230)),
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15.0),
                                  //     ),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       children: [
                                  //         // SizedBox(
                                  //         //   width: 10,
                                  //         // ),
                                  //         SvgPicture.asset(
                                  //             'assets/images/gg.svg'),
                                  //         SizedBox(
                                  //           width: 30,
                                  //         ),
                                  //         Text(
                                  //           "ดำเนินการต่อด้วยบัญชี Google",
                                  //           style: TextStyle(
                                  //               color: Color.fromARGB(
                                  //                   255, 51, 51, 51),
                                  //               fontSize: 15),
                                  //         ),
                                  //       ],
                                  //     ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

const double _kCurveHeight = 25;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);

    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = Palette.kToDark);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}