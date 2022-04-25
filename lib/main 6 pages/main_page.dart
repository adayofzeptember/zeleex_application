import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Career/career.dart';
import 'package:zeleex_application/main%206%20pages/animal.dart';
import 'package:zeleex_application/main%206%20pages/main_widget.dart';
import 'package:zeleex_application/main%206%20pages/newsfeed.dart';
import 'package:zeleex_application/main%206%20pages/products.dart';
import 'package:zeleex_application/main%206%20pages/semens.dart';
import 'package:zeleex_application/main%206%20pages/store_page.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../profile.dart';

// หลักมาก หลักรวม
void main() {
  runApp(Main_Page());
}

class Main_Page extends StatefulWidget {
  Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  bool _isVisible = true;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        _isVisible =
            controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  List<Widget> _widgetsPages = [
    NewsFeedPage(),
    StorePage(),
    Main_Widget(),
    AnimalsPage(),
    ProductPage(),
    SemensPage()
  ];

  int _index = 2;
  void _onItemTapped(int index2) {
    setState(() {
      _index = index2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(232, 36, 28, 28), //desired color
          ),
          child: Container(
            width: 250,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  0,
                  0,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Palette.kToDark,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name Surname",
                                      style: TextStyle(
                                          color: Palette.kToDark,
                                          fontFamily: 'Kanit')),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage()));
                                    },
                                    child: Text(
                                      "ดูโปรไฟล์",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 165, 162, 162),
                                          fontFamily: 'Kanit'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/home.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "หน้าหลัก",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Kanit'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/about.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "เกี่ยวกับเรา",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("ภายในร้าน",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 162, 162),
                              fontFamily: 'Kanit')),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab4.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("สัตว์",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab5.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text("สินค้า",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/tab2.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ร้านค้า",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab6.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text("น้ำเชื้อ",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("การช่วยเหลือ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 162, 162),
                              fontFamily: 'Kanit')),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenterPage()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/help2.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ศูนย์ช่วยเหลือ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CareerPage()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/us.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ร่วมงานกับเรา",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Divider(color: Color.fromARGB(255, 165, 162, 162)),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/logout.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ออกจากระบบ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      body: _widgetsPages.elementAt(_index),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab1.svg",
                  color: Palette.kToDark,
                ),
              ),
              icon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab1.svg",
                ),
              ),
              label: 'นิวส์ฟีด',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab2.svg",
                  color: Palette.kToDark,
                ),
              ),
              icon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab2.svg",
                ),
              ),
              label: 'ร้านค้า',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab3.svg",
                  color: Palette.kToDark,
                ),
              ),
              icon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab3.svg",
                ),
              ),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab4.svg",
                ),
              ),
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab4.svg",
                  color: Palette.kToDark,
                ),
              ),
              label: 'สัตว์',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/new/tab5.svg",
                color: Palette.kToDark,
              ),
              icon: SvgPicture.asset(
                "assets/images/new/tab5.svg",
              ),
              label: 'สินค้า',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab6.svg",
                  color: Palette.kToDark,
                ),
              ),
              icon: SizedBox(
                child: SvgPicture.asset(
                  "assets/images/new/tab6.svg",
                ),
              ),
              label: 'น้ำเชื้อ',
            ),
            
          ],
        ),
      ),
    );
  }
}
