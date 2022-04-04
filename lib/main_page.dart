import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/animal.dart';
import 'package:zeleex_application/main_widget.dart';
import 'package:zeleex_application/newsfeed.dart';
import 'package:zeleex_application/products.dart';
import 'package:zeleex_application/semens.dart';
import 'package:zeleex_application/store_page.dart';

import 'Plate.dart';

// หลักมาก หลักรวม
void main() {
  runApp(const mainPage());
}

toNewspage() {}

toStorePage() {
  return StorePage_Run();
}

toMainPage() {
  return mainpageWidget_only();
}

toAnimalPage() {
  return Animals_Page();
}

toProduct() {
  return Product_Page();
}

toSemenPage() {
  return Semens_Page();
}

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return MyHomePage();
    return (MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber), home: Main_Page()));
  }
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
    toStorePage(),
    toMainPage(),
    toAnimalPage(),
    toProduct(),
    toSemenPage()
  ];

  int _index = 2;
  void _onItemTapped(int index2) {
    setState(() {
      _index = index2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
          fontFamily: 'Kanit',
        ),
        home: Scaffold(
          body: _widgetsPages.elementAt(_index),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(52, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
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
                    activeIcon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/images/new/tab5.svg",
                        color: Palette.kToDark,
                      ),
                    ),
                    icon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/images/new/tab5.svg",
                      ),
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
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
