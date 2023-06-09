// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/Others/ProgressHUD.dart';
import 'package:zeleex_application/Others/shape.dart';
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
                const SizedBox(
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const Text(
                      "ลืมรหัสผ่าน",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      "   ",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
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
                          const Text(
                            'กรอกอีเมล์',
                            style: TextStyle(
                                color: Color.fromARGB(255, 95, 95, 95)),
                          ),
                          const SizedBox(
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
                            ),
                          ),
                          const SizedBox(
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
                                  child: const Text(
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
