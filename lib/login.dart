import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/ProgressHUD.dart';
import 'package:zeleex_application/login_model.dart';
import 'package:zeleex_application/register.dart';
import 'package:zeleex_application/test%20folder/request_reqres.in.dart';
import 'package:zeleex_application/test%20folder/request_zeleex2.dart';
import 'Plate.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken2;
  bool isApiCallProcess = false;
  bool _checking = true;
  String? tokenShow;
  final formKey = GlobalKey<FormState>();
  //late LoginRequestModel requestModel;

  late RequestModel_reqres requestModel_reqres;
  late RequestModel_zeleex2 requestModel_zeleex2;

  @override
  void initState() {
    //_checkIfLogin();
    requestModel_reqres = new RequestModel_reqres();
    requestModel_zeleex2 = new RequestModel_zeleex2();
    super.initState();
  }

  _checkIfLogin() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken2 = accessToken;
      setState(() {
        tokenShow = _accessToken2.toString();
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken2 = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      print(_userData);
      print(_accessToken2);
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken2 = null;
    _userData = null;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetUp(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetUp(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(title: Text("เทส zeleex")),
    //     body: _checking
    //         ? Center(
    //             child: CircularProgressIndicator(),
    //           )
    //         : Center(
    //             child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               _userData != null
    //                   ? Text('name: ${_userData!['name']}')
    //                   : Container(),
    //               _userData != null
    //                   ? Text('email: ${_userData!['email']}')
    //                   : Container(),
    //               _userData != null
    //                   ? Container(
    //                       child: Image.network(
    //                           _userData!['picture']['data']['url']),
    //                     )
    //                   : Container(),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               CupertinoButton(
    //                   color: Colors.blue,
    //                   child: Text(
    //                     _userData != null ? 'ออก' : 'เข้า',
    //                     style: TextStyle(color: Colors.white),
    //                   ),
    //                   onPressed: _userData != null ? _logout : _login)
    //             ],
    //           )),
    //   ),
    // );
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Kanit', primarySwatch: Palette.kToDark),
        home: Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Palette.kToDark),
              title: Center(
                  child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
              backgroundColor: Palette.kToDark,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.1),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/left.svg',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                Text(
                                  "เข้าสู่ระบบ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Text(
                                  ".",
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
                                    TextFormField(
                                      controller: emailController,
                                      onSaved: (input) =>
                                          requestModel_zeleex2.email = input,
                                      keyboardType: TextInputType.emailAddress,
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
                                    TextFormField(
                                      obscureText: true,
                                      controller: passwordController,
                                      onSaved: (input) =>
                                          // requestModel_reqres.password = input,
                                          requestModel_zeleex2.password = input,
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
                                      height: 30,
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
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          // setState(() {
                                          //   isApiCallProcess = true;
                                          // });

                                          login_zeleex2(requestModel_zeleex2)
                                              .then((value) => {
                                                    // setState(() {
                                                    //   isApiCallProcess = false;
                                                    // }),
                                                    if (value.data!.email!
                                                        .isNotEmpty)
                                                      {
                                                        print(value.responseCode
                                                                .toString() +
                                                            value.responseStatus
                                                                .toString()),
                                                 
                                                        print(
                                                            "${value.data!.id} : ${value.data!.email}"),
                                                     
                                                      }
                                                    else
                                                      {
                                                        print("Error"),
                                                      }
                                                  });

                                          // print("-------input-------"+requestModel_zeleex2.toJson().toString());
                                        }
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
                                          side: BorderSide(
                                              color: Palette.kToDark),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage(),
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
                                        _userData != null ? _logout : _login;
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
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
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
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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

Future<void> loginTest() async {
  var response = await http.post(Uri.parse("https://api.zeleex.com/api/login"),
      //var responsex = await http.post(Uri.parse("https://reqres.in/api/login"),
      body: ({
        'email': emailController.text,
        'password': passwordController.text
      }));
  print((response.body.toString()));

  if (response.statusCode == 200) {
    print("collect");
  } else {
    print("invalid");
  }
}
