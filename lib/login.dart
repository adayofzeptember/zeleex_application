import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Post%20Method/post_login.dart';
import 'package:zeleex_application/API/Post%20Method/post_login_social.dart';
import 'package:zeleex_application/ProgressHUD.dart';
import 'package:zeleex_application/login2_testTOKEN.dart';
import 'package:zeleex_application/payment_confirm.dart';
import 'package:zeleex_application/register.dart';

import 'package:zeleex_application/API/Post%20Method/google_login_api.dart';
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
  late RequestModel_zeleex requestModel_zeleex;
  late Request_Social_Provider request_social;
  AlreadyIn_Model loggedin = AlreadyIn_Model();
  bool _isLoggedIn = false;
  Map _userObj = {};
  String storedToken = "";
  String storedUserID = "";
  @override
  void initState() {
    requestModel_zeleex = RequestModel_zeleex();
    request_social = Request_Social_Provider();
    loggedin = AlreadyIn_Model();
    super.initState();
  }

  Future logout_removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('keyToken');
  }

  Future useFacebook_toLogin() async {
    await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) {
        print(userData["name"]);
        print(userData["email"]);
        print(userData["picture"]["data"]["url"]);
        request_social.name = userData["name"];
        request_social.email = userData["email"];
        request_social.avatar = userData["picture"]["data"]["url"];
        request_social.provider = "facebook";
        request_social.provider_id = "1";
        login_Social(request_social);
        print(json.encode(request_social).toString());
        ;
      });
    });
    print(FacebookAuth.instance.accessToken);
  }

  Future<dynamic> useGoogle_toLogin() async {
    final userGoogle = await GoogoleSignInApi.google_SignIn2();
    GoogoleSignInApi.google_SignIn2().then((result) {
      setState(() {
        isApiCallProcess = false;
      });
      result!.authentication.then((googleKey) {
        print("id----------------> " + userGoogle!.id.toString());
        print("access token ------------------> " +
            googleKey.accessToken.toString());
        print("????????? ------------------> " + userGoogle.email.toString());
        print("???????????? -------------------> " + userGoogle.displayName.toString());
        print("????????? ------------------> " + userGoogle.photoUrl.toString());
        request_social.name = userGoogle.displayName.toString();
        request_social.email = userGoogle.email.toString();
        request_social.avatar = userGoogle.photoUrl.toString();
        request_social.provider = "Google";
        request_social.provider_id = userGoogle.id.toString();
        login_Social(request_social);
        // print(json.encode(request_social).toString());
      }).catchError((err) {
        setState(() {
          isApiCallProcess = false;
        });
        print('error in');
      });
    }).catchError((err) {
      setState(() {
        isApiCallProcess = false;
      });
      print('error out');
    });
  }

  //!------------------------------- ?????????????????????????????????-------------------------------------------------------
  Future<Login_Data> loginNormal(RequestModel_zeleex requestModel) async {
    String urlPost = "https://api.zeleex.com/api/login";
    var body_Login = json.encode(requestModel_zeleex.toJson());
    final response = await http.post(
      Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: body_Login,
    );
    print(jsonDecode(response.body.toString()));
    var jsonRes = json.decode(response.body);
    if (response.statusCode == 400 || response.statusCode == 200) {
      var token_toStore = jsonRes['data']['token'].toString();
      String id_toStore = jsonRes['data']['id'].toString();
      setState(() {
        storedToken = token_toStore;
        storedUserID = id_toStore;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('keyToken', storedToken.toString());
      prefs.setString('keyID', storedUserID.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Main_Page(),
        ),
      );
      return Login_Data.fromJson(json.decode(response.body));
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      Fluttertoast.showToast(
          msg:
              "??????????????????????????????????????????????????????????????????, ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 133, 133, 133),
          textColor: Colors.white,
          fontSize: 15);
      throw Exception("error");
    }
  }

  Future<Login_Social_Data> login_Social(
      Request_Social_Provider request_social_provider) async {
    String urlPost = "https://api.zeleex.com/api/register/social";
    var bodySocial = json.encode(request_social_provider.toJson());
    final response = await http.post(
      Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: bodySocial,
    );
    if (response.statusCode == 400 || response.statusCode == 200) {
      var jsonRes = json.decode(response.body);
      var kkk = jsonRes['data']['token'];
      String id_toStore2 = jsonRes['data']['id'].toString();

      setState(() {
        storedToken = kkk;
        storedUserID = id_toStore2;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('keyToken', storedToken.toString());
      prefs.setString('keyID', storedUserID.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Main_Page(),
        ),
      );
      return Login_Social_Data.fromJson(json.decode(response.body));
    } else {
      throw Exception("error");
    }
  }

//!-----------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetUp(context), inAsyncCall: isApiCallProcess, opacity: 0.3);
  }

  @override
  Widget _uiSetUp(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Kanit', primarySwatch: Palette.kToDark),
        home: Scaffold(
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
                                  "?????????????????????????????????",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Palette.kToDark,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                          requestModel_zeleex.email = input,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '???????????????????????????????????????';
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
                                        labelText: '???????????????',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      controller: passwordController,
                                      onSaved: (input) =>
                                          requestModel_zeleex.password = input,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '????????????????????????????????????????????????';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline),
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
                                        labelText: '????????????????????????',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        child: Text(
                                          "??????????????????????????????????",
                                          style: TextStyle(
                                              color: Palette.kToDark,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                          setState(() {
                                            isApiCallProcess = true;
                                          });
                                          loginNormal(requestModel_zeleex)
                                              .then((value) => {
                                                    if (value.data!.email!
                                                        .isNotEmpty)
                                                      {
                                                        setState(() {
                                                          isApiCallProcess =
                                                              false;
                                                        }),
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          isApiCallProcess =
                                                              false;
                                                        }),
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
                                            "?????????????????????????????????",
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
                                        // GoogoleSignInApi.google_LogOut();
                                        // FacebookAuth.instance
                                        //     .logOut()
                                        //     .then((value) {
                                        //   setState(() {
                                        //     _isLoggedIn = false;
                                        //     _userObj = {};
                                        //   });
                                        // });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "??????????????????????????????????????????",
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
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0, right: 20.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 36,
                                            )),
                                      ),
                                      Text("????????????"),
                                      Expanded(
                                        child: Container(
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
                                        useFacebook_toLogin();
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
                                                  "???????????????????????????????????????????????? Facebook",
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
                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        useGoogle_toLogin();
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
                                                  "??????????????????????????????????????????????????????????????? Google",
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
    final path = Path();
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
