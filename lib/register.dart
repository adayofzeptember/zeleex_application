import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Plate.dart';
import 'login.dart';
import 'terms.dart';

class RegisterPage extends StatefulWidget {
  final GoogleSignInAccount user;
  RegisterPage({Key? key, required this.user}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return Palette.kToDark;
  }

  @override
  Widget build(BuildContext context) {
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
                            widget.user.email,
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
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  // focusedBorder: OutlineInputBorder(

                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    // borderSide:
                                    //     BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.0),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.0),
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
                                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: '\tรหัสผ่าน',
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_open_outlined),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 238, 238),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
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
                                        });
                                      }),
                                  Text(
                                    "ยอมรับเงื่อนไข",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 51, 51, 51)),
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
                                          decoration: TextDecoration.underline,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                  Text(
                                    "และ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 51, 51, 51)),
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
                                          decoration: TextDecoration.underline,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
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
                                          // side: BorderSide(color: Colors.red),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                      onPressed: () {},
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
        ));
  }
}
