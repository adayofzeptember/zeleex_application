import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Post%20Method/post_login.dart';
import 'package:zeleex_application/ProgressHUD.dart';
import 'package:zeleex_application/login2_testTOKEN.dart';
import 'package:zeleex_application/login_model.dart';
import 'package:zeleex_application/payment_confirm.dart';
import 'package:zeleex_application/register.dart';
import 'package:zeleex_application/API/Post%20Method/google_signin_api.dart';
import 'package:zeleex_application/test%20folder/request_reqres.in.dart';
import 'API/model.dart';
import 'Plate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

import 'main 6 pages/main_page.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;
  final formKey = GlobalKey<FormState>();
  late RequestModel_zeleex2 requestModel_zeleex2;
  AlreadyIn_Model loggedin = AlreadyIn_Model();
  //! logged in ลองเอาไปใส่ในข้อมูลส่งไปหน้าอื่น
  var x;

  @override
  void initState() {
    requestModel_zeleex2 = RequestModel_zeleex2();
    loggedin = AlreadyIn_Model();
    super.initState();
  }

  Future logout_removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('keyToken');
    prefs.remove('keyEmail');
    prefs.remove('keyID');
  }

  Future<Login_Data> login(RequestModel_zeleex2 requestModel_zeleex2) async {
    print(
        "-----------------------------------------------Login-----------------------------------------------------------------------");

    String urlPost = "https://api.zeleex.com/api/login";
    var body_Login = json.encode(requestModel_zeleex2.toJson());
    final response = await http.post(Uri.parse(urlPost),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: body_Login);

    print(jsonDecode(response.body.toString()));
    var jsonRes = json.decode(response.body);

    if (response.statusCode == 400 || response.statusCode == 200) {
      var id_toStore = jsonRes['data']['id'].toString();
      var email_toStore = jsonRes['data']['email'].toString();
      var token_toStore = jsonRes['data']['token'].toString();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('keyToken', token_toStore.toString());
      prefs.setString('keyEmail', email_toStore.toString());
      prefs.setString('keyID', id_toStore.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Main_Page(),
        ),
      );
      return Login_Data.fromJson(json.decode(response.body));
    } else {
      Fluttertoast.showToast(
          msg:
              "ไม่พบบัญชีผู้ใช้ในระบบ, สมัครบัญชีใหม่หรือตรวจสอบอีเมลและรหัสผ่านอีกครั้ง",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 133, 133, 133),
          textColor: Colors.white,
          fontSize: 15);
      throw Exception("error...");
    }
  }

  Future google_Login() async {
    final userGoogle = await GoogoleSignInApi.google_SignIn();
    print(
        "--------------------------------------------------------------------------------");

    GoogoleSignInApi.google_SignIn2().then((result) {
      result!.authentication.then((googleKey) {
        print("id token ----------------> " + googleKey.idToken.toString());
        print("access token ------------------> " +
            googleKey.accessToken.toString());
        print("gmail ------------------> " + userGoogle!.email.toString());
        print("name -------------------> " + userGoogle.displayName.toString());
        print("image ------------------> " + userGoogle.photoUrl.toString());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(user: userGoogle),
          ),
        );
      }).catchError((err) {
        print('error in');
      });
    }).catchError((err) {
      print('error out');
    });
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'โปรดกรอกอีเมล';
                                        }
                                      },
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'โปรดกรอกรหัสผ่าน';
                                        }
                                      },
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
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          // setState(() {
                                          //   isApiCallProcess = true;
                                          // });
                                          login(requestModel_zeleex2)
                                              .then((value) => {
                                                    // setState(() {
                                                    //   isApiCallProcess = false;
                                                    // }),
                                                    if (value.data!.email!
                                                        .isNotEmpty)
                                                      {
                                                        //x = AlreadyIn_Model(name: "sdf", id: ),
                                                        //loggedin.email = "asdf",
                                                        print(value.responseCode
                                                                .toString() +
                                                            " " +
                                                            value.responseStatus
                                                                .toString()),
                                                        print(
                                                            "${value.data!.id} : ${value.data!.email}"),
                                                        print(
                                                            "token : ${value.data!.token}"),
                                                      }
                                                    else
                                                      {
                                                        print(
                                                            "logged in failed")
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
                                      onPressed: () {},
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
                                        // _userData != null ? _logout : _login;
                                        GoogoleSignInApi.google_LogOut();
                                        logout_removeToken();
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
                                      onPressed: () {
                                        google_Login();
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
