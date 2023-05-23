// ignore_for_file: non_constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Post%20Method/post_login.dart';
import 'package:zeleex_application/API/Post%20Method/post_login_social.dart';
import 'package:zeleex_application/register.dart';
import 'package:zeleex_application/API/Post%20Method/google_login_api.dart';
import 'API/model.dart';
import 'Others/Plate.dart';
import 'Others/ProgressHUD.dart';
import 'dart:async';
import 'dart:convert';
import 'Others/shape.dart';
import 'forgot_password_email.dart';
import 'Screens/Main Sixx Pages/bottomMenu_main_page.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
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
    //!ทำก่อน login social

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
      });
    });
    print(FacebookAuth.instance.accessToken);
  }

  Future<dynamic> useGoogle_toLogin() async {
    //*ทำก่อน login social
    final userGoogle = await GoogoleSignInApi.google_SignIn2();
    GoogoleSignInApi.google_SignIn2().then((result) {
      setState(() {
        isApiCallProcess = false;
      });
      result!.authentication.then((googleKey) {
        print("id----------------> " + userGoogle!.id.toString());
        print("access token ------------------> " +
            googleKey.accessToken.toString());
        print("เมล ------------------> " + userGoogle.email.toString());
        print("ชื่อ -------------------> " + userGoogle.displayName.toString());
        print("รูป ------------------> " + userGoogle.photoUrl.toString());
        request_social.name = userGoogle.displayName.toString();
        request_social.email = userGoogle.email.toString();
        request_social.avatar = userGoogle.photoUrl.toString();
        request_social.provider = "Google";
        request_social.provider_id = userGoogle.id.toString();
        login_Social(request_social);
        // print(json.encode(request_social).toString());
      }).catchError((error1) {
        setState(() {
          isApiCallProcess = false;
        });
        print('error in');
      });
    }).catchError((error2) {
      setState(() {
        isApiCallProcess = false;
      });
      print('error out');
    });
  }

  //*------------------------------- เข้าสู่ระบบ-------------------------------------------------------

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
          builder: (context) => BottomMenu_Page(),
        ),
      );
      return Login_Data.fromJson(json.decode(response.body));
    } 
    else {
      setState(() {
        isApiCallProcess = false;
      });
      Fluttertoast.showToast(
          msg:
              "ไม่พบบัญชีผู้ใช้ในระบบ, สมัครบัญชีใหม่หรือตรวจสอบอีเมลและรหัสผ่านอีกครั้ง",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: const Color.fromARGB(255, 133, 133, 133),
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
    if (response.statusCode == 200 || response.statusCode == 400) {
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
      print(storedUserID);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomMenu_Page(),
        ),
      );
      return Login_Social_Data.fromJson(json.decode(response.body));
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetUp(context), inAsyncCall: isApiCallProcess, opacity: 0.3);
  }

  @override
  Widget _uiSetUp(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Kanit', primarySwatch: ZeleexColor.zeleexGreen),
        home: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(height: 180),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/images/left.svg',
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            const Text(
                              "เข้าสู่ระบบ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            const Text(
                              "",
                              style: TextStyle(
                                  color: ZeleexColor.zeleexGreen,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                controller: emailController,
                                onSaved: (input) =>
                                    requestModel_zeleex.email = input,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'โปรดกรอกอีเมล';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.mail_outline),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: 'อีเมล',
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                onSaved: (input) =>
                                    requestModel_zeleex.password = input,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'โปรดกรอกรหัสผ่าน';
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: 'รหัสผ่าน',
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Forgot_Password_Page()));
                                },
                                child: Container(
                                  child: const Text(
                                    "ลืมรหัสผ่าน?",
                                    style: TextStyle(
                                        color: ZeleexColor.zeleexGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: ZeleexColor.zeleexGreen,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    setState(() {
                                      isApiCallProcess = true;
                                    });
                                    loginNormal(requestModel_zeleex)
                                        .then((value) => {
                                              if (value.data!.email!.isNotEmpty)
                                                {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  }),
                                                }
                                              else
                                                {
                                                  setState(() {
                                                    isApiCallProcess = false;
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
                                    child: const Text(
                                      "เข้าสู่ระบบ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: const BorderSide(
                                        color: ZeleexColor.zeleexGreen),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
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
                                    child: const Text(
                                      "สร้างบัญชีใหม่",
                                      style: TextStyle(
                                          color: ZeleexColor.zeleexGreen,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 36,
                                      )),
                                ),
                                const Text("หรือ"),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 36,
                                      )),
                                ),
                              ]),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    // side: BorderSide(color: ZeleexColor.zeleexGreen),
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
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
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Text(
                                            "ดำเนินการต่อด้วย Facebook",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 231, 231, 231)),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
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
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Text(
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
