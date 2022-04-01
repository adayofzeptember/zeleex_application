import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/main_widget.dart';


import 'Plate.dart';

void main(List<String> args) {
  runApp(HelpCenter());
}

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpCenter_widget(),
    );
  }
}

class HelpCenter_widget extends StatefulWidget {
  HelpCenter_widget({Key? key}) : super(key: key);

  @override
  State<HelpCenter_widget> createState() => _HelpCenter_widgetState();
}

class _HelpCenter_widgetState extends State<HelpCenter_widget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Kanit',
            primarySwatch: Palette.kToDark,
            appBarTheme: AppBarTheme(color: Colors.white)),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   // Status bar color
            //   statusBarColor: Colors.white,
            // ),
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "ศูนย์ช่วยเหลือ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                    splashColor: Colors.amber,
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => mainpageWidget_only()));
                    },
                    child: SvgPicture.asset('assets/images/xcircle.svg')),
              ],
            ),
          ),
          
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      height: 70,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon:
                              Icon(Icons.search, color: Palette.kToDark),
                          hintStyle: TextStyle(color: Palette.kToDark),
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 230, 228, 228),
                                width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0),
                          ),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                child: Text(
                  "คำถามที่พบบ่อย",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 192, 192, 192),
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(255, 233, 233, 233))
                        border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "การจัดการระบบสั่งซื้อสมาชิก",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(255, 233, 233, 233))
                        border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ฉันจะเพิ่ม/ลบ/แก้ไข ที่อยู่ร้านค้าได้อย่างไร?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(255, 233, 233, 233))
                        border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ฉันจะเพิ่มสินค้าได้อย่างไร?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(255, 233, 233, 233))
                        border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ฉันจะติดต่อ Zeleex ได้อย่างไร?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(255, 233, 233, 233))
                        border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                      bottom:
                          BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "การใช้งานแอปพลิเคชัน",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ],
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}