// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/Others/ProgressHUD.dart';
import 'package:zeleex_application/Others/shape.dart';
import 'package:zeleex_application/Screens/Other%20Pages/terms.dart';
import '../../bloc/check box/check_bloc.dart';
import '../../bloc/login and register/login_register_bloc.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  //?
  final formKey_Register = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _sureNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordConfirm_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _register(context),
            inAsyncCall: state.loading,
            opacity: 0.3);
      },
    );
  }

  Widget _register(BuildContext context) {
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
                key: formKey_Register,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Center(
                      child: Text(
                        "สร้างบัญชี",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกชื่อ';
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\t\t\t\tชื่อ',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _sureNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกนามสกุล';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\t\t\t\tนามสกุล',
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอก   อีเมล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.mail_outline),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\tอีเมล',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกรหัสผ่าน';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              // suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\tรหัสผ่าน',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกยืนยันรหัสผ่าน';
                              }

                              return null;
                            },
                            controller: _passwordConfirm_Controller,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_open_outlined),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\tยืนยันรหัสผ่าน',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BlocBuilder<CheckBloc, CheckState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                ZeleexColor.zeleexGreen,
                                            value: state.isCheck,
                                            onChanged: (value) {
                                              context.read<CheckBloc>().add(
                                                  CheckboxChangeMainAddressx(
                                                      getCheck: value!));
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
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
                                                      TermsConditon()));
                                        },
                                        child: const Text(
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
                                      const Text(
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
                                                      TermsConditon()));
                                        },
                                        child: const Text(
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
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: const Color.fromARGB(
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
                                            padding:
                                                const EdgeInsets.all(20.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "ยกเลิก",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary:
                                                  ZeleexColor.zeleexGreen,

                                              // side: BorderSide(color: Colors.red),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                          onPressed: state.isCheck
                                              ? (() {
                                                  if (formKey_Register
                                                      .currentState!
                                                      .validate()) {
                                                    formKey_Register
                                                        .currentState
                                                        ?.save();

                                                    context
                                                        .read<
                                                            LoginRegisterBloc>()
                                                        .add(Register_Casual(
                                                            context: context,
                                                            getRegisterName:
                                                                _nameController
                                                                    .text,
                                                            getRegisterEmail:
                                                                _emailController
                                                                    .text,
                                                            getRegisterPassword1:
                                                                _passwordController
                                                                    .text,
                                                            getRegisterPassword2:
                                                                _passwordConfirm_Controller
                                                                    .text,
                                                            getRegisterPolicy:
                                                                state.isCheck,
                                                            getRegisterSurename:
                                                                _sureNameController
                                                                    .text));
                                                  }
                                                })
                                              : null,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(20.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "สร้างบัญชี",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
            
            
                              );
                            },
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
  }
}
