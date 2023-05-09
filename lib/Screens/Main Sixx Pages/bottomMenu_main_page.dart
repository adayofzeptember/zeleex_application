import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/newsfeed_page.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/profile_page.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/home_page.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/stores_page.dart';
import 'package:zeleex_application/bloc/bottom_menu_switch/bottom_menu_switch_bloc.dart';
import '../../Others/Plate.dart';
import 'animals_page.dart';
import 'products_page.dart';
import '../../bloc/profile/profile_bloc.dart';

class BottomMenu_Page extends StatefulWidget {
  BottomMenu_Page({Key? key}) : super(key: key);

  @override
  State<BottomMenu_Page> createState() => _BottomMenu_PageState();
}

class _BottomMenu_PageState extends State<BottomMenu_Page> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(Load_Profile());
    context.read<ProfileBloc>().add(Load_Address());
    super.initState();
  }

  List<Widget> _widgetsPages = [
    NewsFeedPage(),
    StorePage(),
    HomePage(),
    AnimalsPage(),
    ProductsPage(),
    ProfilePage()
  ];

  int _index = 2;
  void onSwitchTab(int index2) {
    context
        .read<BottomMenuSwitchBloc>()
        .add(TapSwitchIndex(indexFromWidget: index2));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuSwitchBloc, BottomMenuSwitchState>(
      builder: (context, state) {
        return Scaffold(
          body: _widgetsPages.elementAt(state.bottomSwitch_index),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: state.bottomSwitch_index,
              onTap: onSwitchTab,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/images/new/tab1.svg",
                      color: ZeleexColor.zeleexGreen,
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
                      color: ZeleexColor.zeleexGreen,
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
                      color: ZeleexColor.zeleexGreen,
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
                      color: ZeleexColor.zeleexGreen,
                    ),
                  ),
                  label: 'สัตว์',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/images/new/tab5.svg",
                    color: ZeleexColor.zeleexGreen,
                  ),
                  icon: SvgPicture.asset(
                    "assets/images/new/tab5.svg",
                  ),
                  label: 'สินค้า',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/images/new/tab6.svg",
                    color: ZeleexColor.zeleexGreen,
                  ),
                  icon: SvgPicture.asset(
                    "assets/images/new/tab6.svg",
                  ),
                  label: 'โพรไฟล์',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
