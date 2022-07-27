import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../from Profile/profile.dart';

class SemensPage extends StatefulWidget {
  SemensPage({Key? key}) : super(key: key);

  @override
  State<SemensPage> createState() => _SemensPageState();
}

class _SemensPageState extends State<SemensPage> {
  int index = 5;
  void _onItemTapped(int index2) {
    setState(() {
      index = index2;
    });
  }

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
      home: Scaffold(
        // drawer: MyDrawyer(),
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark),
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                    child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: Color.fromARGB(255, 51, 51, 51),
                )),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Visibility(
                    visible: false,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text("น้ำเชื้อ",
                      style: TextStyle(
                          color: Palette.kToDark, fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/sort.svg',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/shopping-cart.svg',
                      )
                    ],
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print("object");
                            //MediaQuery.of(context).size.height * 0.25
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "กระบือ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Palette.kToDark,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "โคเนื้อ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "กระบือ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens6.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens3.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens1.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens1.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens3.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/semens3.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // drawer: Theme(
        //     data: Theme.of(context).copyWith(
        //       canvasColor: Color.fromARGB(232, 36, 28, 28), //desired color
        //     ),
        //     child: Container(
        //       width: 250,
        //       child: Drawer(
        //         child: Padding(
        //           padding: const EdgeInsets.fromLTRB(
        //             20,
        //             0,
        //             0,
        //             0,
        //           ),
        //           child: Container(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 SizedBox(
        //                   height: 50,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => ProfilePage()));
        //                   },
        //                   child: Row(
        //                     children: [
        //                       CircleAvatar(
        //                         backgroundColor: Colors.white,
        //                         child: Icon(
        //                           Icons.person,
        //                           color: Palette.kToDark,
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Text("Name Surname",
        //                                 style: TextStyle(
        //                                     color: Palette.kToDark,
        //                                     fontFamily: 'Kanit')),
        //                             SizedBox(
        //                               height: 5,
        //                             ),
        //                             Text(
        //                               "ดูโปรไฟล์",
        //                               style: TextStyle(
        //                                   color: Color.fromARGB(
        //                                       255, 165, 162, 162),
        //                                   fontFamily: 'Kanit'),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       Icon(
        //                         Icons.settings,
        //                         color: Colors.white,
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 50,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.pushReplacement(
        //                       context,
        //                       MaterialPageRoute(
        //                         builder: (context) => Main_Page(),
        //                       ),
        //                     );
        //                   },
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/home.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text(
        //                           "หน้าหลัก",
        //                           style: TextStyle(
        //                               color: Colors.white, fontFamily: 'Kanit'),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => AboutUs()));
        //                   },
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/about.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text(
        //                           "เกี่ยวกับเรา",
        //                           style: TextStyle(
        //                               color: Colors.white, fontFamily: 'Kanit'),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 Text("ภายในร้าน",
        //                     style: TextStyle(
        //                         color: Color.fromARGB(255, 165, 162, 162),
        //                         fontFamily: 'Kanit')),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 Row(
        //                   children: [
        //                     SvgPicture.asset(
        //                       'assets/images/new/tab4.svg',
        //                       color: Colors.white,
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        //                       child: Text("สัตว์",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontFamily: 'Kanit')),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 Row(
        //                   children: [
        //                     SvgPicture.asset(
        //                       'assets/images/new/tab5.svg',
        //                       color: Colors.white,
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                       child: Text("สินค้า",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontFamily: 'Kanit')),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     print("object");
        //                   },
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/tab2.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text("ร้านค้า",
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily: 'Kanit')),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 Row(
        //                   children: [
        //                     SvgPicture.asset(
        //                       'assets/images/new/tab6.svg',
        //                       color: Colors.white,
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                       child: Text("น้ำเชื้อ",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontFamily: 'Kanit')),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 Text("การช่วยเหลือ",
        //                     style: TextStyle(
        //                         color: Color.fromARGB(255, 165, 162, 162),
        //                         fontFamily: 'Kanit')),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => HelpCenterPage()));
        //                   },
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/help2.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text("ศูนย์ช่วยเหลือ",
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily: 'Kanit')),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => CareerPage()));
        //                   },
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/us.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text("ร่วมงานกับเรา",
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily: 'Kanit')),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 100,
        //                 ),
        //                 Divider(color: Color.fromARGB(255, 165, 162, 162)),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/new/logout.svg',
        //                         color: Colors.white,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        //                         child: Text("ออกจากระบบ",
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily: 'Kanit')),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     )),
      ),
    );
  }
}
