import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/main_widget.dart';

import 'Plate.dart';


class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,
            ),
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
                   
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Main_Widget()));
                    },
                    child: SvgPicture.asset('assets/images/xcircle.svg')),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 60,
                    width: double.infinity,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Palette.kToDark,
                          size: 20,
                        ),
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
                    )),
              ),
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
      );
   
  }
}
