import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../login.dart';
import 'Others/Plate.dart';
import 'Others/ProgressHUD.dart';
import 'Others/shape.dart';
import 'forgot_password_reset.dart';

var _nameController = TextEditingController();
var _sureNameController = TextEditingController();
var _emailController = TextEditingController();
var _passwordController = TextEditingController();
var _passwordConfirm_Controller = TextEditingController();

class Forgot_Password_Page extends StatefulWidget {
  Forgot_Password_Page({Key? key}) : super(key: key);
  @override
  State<Forgot_Password_Page> createState() => _Forgot_Password_PageState();
}

class _Forgot_Password_PageState extends State<Forgot_Password_Page> {
  final formKey_Register = GlobalKey<FormState>();

  bool isApiCallProcess = false;
  String allName = "";
  String allSureName = '';

  bool checkIfAgree = false;
  var storedToken = "";
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _register(context), inAsyncCall: isApiCallProcess, opacity: 0.3);
  }

  @override
  Widget _register(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: ShapesPainter(),
              child:
                  Container(height: MediaQuery.of(context).size.height * 0.2),
            ),
            Column(
              children: [
                SizedBox(
                  height: 100,
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      "ลืมรหัสผ่าน",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "   ",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey_Register,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'กรอกอีเมล์',
                            style: TextStyle(
                                color: Color.fromARGB(255, 95, 95, 95)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกอีเมล์';
                              }
                            },
                            controller: _nameController,
                            onSaved: (input) => setState(() {
                              allName = input.toString();
                            }),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: ZeleexColor.zeleexGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Forgot_Password_Page_Reset(),
                                ),
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "ดำเนินการต่อ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
