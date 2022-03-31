
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Plate.dart';
import 'login.dart';
import 'terms.dart';

void main(List<String> args) {
  runApp(RegisterPage_widget());
}



class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage_widget(),
    );
  }
}

class RegisterPage_widget extends StatefulWidget {
  RegisterPage_widget({Key? key}) : super(key: key);

  @override
  State<RegisterPage_widget> createState() => _RegisterPage_widgetState();
}

class _RegisterPage_widgetState extends State<RegisterPage_widget> {
  bool isChecked = false;
  @override
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Kanit', primarySwatch: Palette.kToDark),
        home: Scaffold(
            appBar: AppBar(
              // systemOverlayStyle: SystemUiOverlayStyle(
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
                      // SvgPicture.asset('assets/images/cir14.svg')
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
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage2()));
                                },
                                child: SvgPicture.asset(
                                  'assets/images/left.svg',
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "สมัครสมาชิก",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
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
                                      // focusedBorder: OutlineInputBorder(
                                      //   // borderSide:
                                      //   //     BorderSide(color: Colors.white),
                                      //   borderRadius: BorderRadius.circular(10.7),
                                      // ),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.white, width: 0.0),
                                      // ),
                                      // enabledBorder: UnderlineInputBorder(
                                      //   borderSide:
                                      //       BorderSide(color: Colors.white),
                                      //   borderRadius: BorderRadius.circular(25.7),
                                      // ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 243, 238, 238),
                                      border: OutlineInputBorder(
                                        // borderSide:
                                        //     BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      labelText: '\t\t\t\tชื่อ',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
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
                                      labelText: '\t\t\t\tนามสกุล',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
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
                                      labelText: '\tอีเมล',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_outline),
                                      suffixIcon:
                                          Icon(Icons.remove_red_eye_sharp),
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
                                      labelText: '\tรหัสผ่าน',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.lock_open_outlined),
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
                                      labelText: '\tยืนยันรหัสผ่าน',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: Palette.kToDark,
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          }),
                                      Text(
                                        "ยอมรับเงื่อนไข",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (contetx) =>
                                                      TermsCondition()));
                                        },
                                        child: Text(
                                          "นโยบายความเป็นส่วนตัว",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51)),
                                        ),
                                      ),
                                      Text(
                                        "และ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TermsCondition()));
                                        },
                                        child: Text(
                                          "เงื่อนไขการให้บริการ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: Color.fromARGB(
                                                  255, 207, 207, 207),
                                              // side: BorderSide(color: Colors.red),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage2()),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "ยกเลิก",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
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
                                                "สร้างบัญชี",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
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
