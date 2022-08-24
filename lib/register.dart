import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/ProgressHUD.dart';
import 'API/Post Method/post_Register.dart';
import 'Plate.dart';
import 'login.dart';
import 'main 6 pages/onlyMenuForMainPage_nothing_here.dart';
import 'terms.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

var _nameController = TextEditingController();
var _sureNameController = TextEditingController();
var _emailController = TextEditingController();
var _passwordController = TextEditingController();
var _passwordConfirm_Controller = TextEditingController();

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey_Register = GlobalKey<FormState>();
  late Register_Model register_model;
  bool isApiCallProcess = false;
  String allName = "";
  String allSureName = '';
  bool checkIfAgree = false;
  var storedToken = "";

  @override
  void initState() {
    super.initState();
    register_model = Register_Model();
  }

  bool isChecked = false;

  _registerNowBitchhhh() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey_Register.currentState!.validate()) {
      formKey_Register.currentState?.save();

      setState(() {
        isApiCallProcess = true;
      });
      register_model.name = allName + " " + allSureName;

      _registerNormal(register_model).then((value) => {
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
    }
  }

  Future<Register> _registerNormal(Register_Model registerModel) async {
    String urlPost = "https://api.zeleex.com/api/register";
    var body_Register = json.encode(registerModel.toJson());
    final response = await http.post(
      Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: body_Register,
    );

    print(json.decode(response.body.toString()));
    var jsonRes = json.decode(response.body);

    if (response.statusCode == 400 || response.statusCode == 200) {
      var response_status = jsonRes['responseStatus'].toString();
      var response_code = jsonRes['responseCode'].toString();

      if (response_status == 'false' && response_code == 'UR0101') {
        setState(() {
          isApiCallProcess = false;
        });
        Fluttertoast.showToast(
            msg: "ลงทะเบียนไม่สำเร็จ, โปรดตรวจสอบความถูกต้องของข้อมูล",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromARGB(255, 230, 97, 97),
            textColor: Colors.white,
            fontSize: 15);
      } else {
        var tokenFromRegister = jsonRes['data']['token'];
        setState(() {
          storedToken = tokenFromRegister;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('keyToken', storedToken.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Main_Page(),
          ),
        );
      }

      return Register.fromJson(json.decode(response.body));
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _register(context), inAsyncCall: isApiCallProcess, opacity: 0.3);
  }

  @override
  Widget _register(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: Palette.kToDark),
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
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1),
                  ),
                  Column(
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
                            "ลงทะเบียนบัญชี",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "   ",
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
                      Form(
                        key: formKey_Register,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกชื่อ';
                                    }
                                  },
                                  controller: _nameController,
                                  onSaved: (input) => setState(() {
                                    allName = input.toString();
                                  }),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    labelText: '\t\t\t\tชื่อ',
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _sureNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกนามสกุล';
                                    }
                                  },
                                  onSaved: (input) => setState(() {
                                    allSureName = input.toString();
                                  }),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    labelText: '\t\t\t\tนามสกุล',
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกอีเมล';
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  onSaved: (input) =>
                                      register_model.email = input,
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    labelText: '\tอีเมล',
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกรหัสผ่าน';
                                    }
                                  },
                                  controller: _passwordController,
                                  onSaved: (input) =>
                                      register_model.password = input,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outline),
                                    // suffixIcon: Icon(Icons.remove_red_eye_sharp),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    labelText: '\tรหัสผ่าน',
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกยืนยันรหัสผ่าน';
                                    }
                                  },
                                  controller: _passwordConfirm_Controller,
                                  onSaved: (input) => register_model
                                      .password_confirmation = input,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_open_outlined),
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
                                      borderRadius: BorderRadius.circular(20.0),
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
                                            setState(() {
                                              checkIfAgree = !checkIfAgree;
                                            });
                                            if (value == true) {
                                              register_model
                                                  .policy_confirmation = 'true';
                                            }
                                            print(checkIfAgree);
                                          });
                                        }),
                                    Text(
                                      "ยอมรับเงื่อนไข",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (contetx) =>
                                                    TermsConditon()));
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
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TermsConditon()));
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          Navigator.pop(context);
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
                                            primary: checkIfAgree
                                                ? Palette.kToDark
                                                : Colors.grey,
                                            // side: BorderSide(color: Colors.red),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                        onPressed: () {
                                          _registerNowBitchhhh();
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
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
