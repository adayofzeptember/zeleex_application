import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Plate.dart';
import 'cart.dart';
import 'payment_address.dart';

void main(List<String> args) {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile_widget(),
    );
  }
}

class Profile_widget extends StatefulWidget {
  Profile_widget({Key? key}) : super(key: key);

  @override
  State<Profile_widget> createState() => _Profile_widgetState();
}

class _Profile_widgetState extends State<Profile_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.kToDark,
        appBarTheme: AppBarTheme(color: Palette.kToDark),
      ),
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Palette.kToDark,
          ),
          backgroundColor: Palette.kToDark,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaymentPage(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "โปรไฟล์",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/cart123.svg',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Palette.kToDark,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 70,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 202, 5, 5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name Surname",
                              style: TextStyle(
                                  fontFamily: 'Kanit',
                                  fontSize: 20,
                                  color: Colors.white)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "แก้ไขโปรไฟล์ >",
                            style: TextStyle(
                                color: Color.fromARGB(255, 51, 51, 51),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/buy.svg',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("การสั่งซื้อ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 15)),
                    ],
                  ),
                  Text(
                    "ประัติการสั่งซื้อ >",
                    style: TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet.svg',
                            height: 40,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            "ที่ต้องชำระ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/box.svg',
                          height: 40,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "เตรียมจัดส่ง",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/shipp.svg',
                          height: 40,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "กำลังจัดส่ง",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/score.svg',
                          height: 40,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "ให้คะแนน",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentAddressPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 233, 233, 233))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/pin.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "ที่อยู่สำหรับจัดส่ง",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "ชวันธร วีรจรรยาพันธ์",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\t (ค่าเริ่มต้น)",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 130, 130, 130),
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Container(
                              width: 250,
                              child: Text(
                                "087-571-2533",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 130, 130, 130),
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Container(
                              width: 250,
                              child: Text(
                                "369/11 เดชอุดม ซอย 6 ตำบลในเมือง อำเภอเมือง จังหวัดนครราชสีมา 30000",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 130, 130, 130),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentAddressPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 233, 233, 233)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/heart.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "สิ่งที่ถูกใจ >",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Palette.kToDark),
                      primary: Palette.kToDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/store2.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "เริ่มการขาย ลงทะเบียนฟรี",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
             InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentAddressPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 233, 233, 233)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/heart.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "นโยบายความเป็นส่วนตัว >",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
             InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentAddressPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 233, 233, 233)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/heart.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "ศูนย์ช่วยเหลือ >",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
             InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentAddressPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 233, 233, 233)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/heart.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "ร่วมงานกับเรา >",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),

                    Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(255, 95, 95, 95)),
                      primary: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      child: 
                          Text(
                            "เปลี่ยนบัญชีผู้ใช้",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize: 15,
                            ),
                          ),
                       
                      
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}