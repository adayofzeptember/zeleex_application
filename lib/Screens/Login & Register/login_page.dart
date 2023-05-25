// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/Others/shape.dart';
import 'package:zeleex_application/Screens/Login%20&%20Register/register_page.dart';
import 'package:zeleex_application/bloc/login%20and%20register/login_register_bloc.dart';
import 'package:zeleex_application/forgot_password_email.dart';

import '../../Others/ProgressHUD.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiLogin(context), inAsyncCall: state.loading, opacity: 0.3);
      },
    );
  }

  Widget _uiLogin(BuildContext context) {
    return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return Scaffold(
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
                        Center(
                          child: const Text(
                            "เข้าสู่ระบบ",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'โปรดกรอกอีเมล';
                                  }
                                  return null;
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
                                  hintText: 'อีเมล',
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'โปรดกรอกรหัสผ่าน';
                                  }
                                  return null;
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
                                  hintText: 'รหัสผ่าน',
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
                                    // print(emailController.text +
                                    //     passwordController.text);
                                    context.read<LoginRegisterBloc>().add(
                                        Login_Casual(
                                            context: context,
                                            getEmail: emailController.text,
                                            getPassword:
                                                passwordController.text));
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
                                    PageTransition(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      type: PageTransitionType.fade,
                                      child: RegisterPage(),
                                    ),
                                  );
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
                                  // useFacebook_toLogin();
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
                                  //  useGoogle_toLogin();
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
        ));
      },
    );
  }
}
