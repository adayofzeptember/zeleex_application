import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import '../from Profile/profile.dart';

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
    loginh();
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
    ProfilePage()
  ];

  int _index = 2;
  void _onItemTapped(int index2) {
    setState(() {
      _index = index2;
    });
  }

  String k = '';
  Future loginh() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    setState(() {
      k = x.toString();
    });
    print("----------------------------kkkkkkk-" + x.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              activeIcon: SvgPicture.asset(
                "assets/images/new/tab6.svg",
                color: Palette.kToDark,
              ),
              icon: SvgPicture.asset(
                "assets/images/new/tab6.svg",
              ),
              label: 'โปรไฟล์',
            ),
          ],
        ),
      ),
    );
  }
}
