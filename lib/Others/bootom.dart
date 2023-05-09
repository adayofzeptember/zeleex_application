// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/newsfeed_page.dart';
// import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/profile_page.dart';
// import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/home_page.dart';
// import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/stores_page.dart';
// import '../Others/Plate.dart';
// import '../Screens/Main Sixx Pages/animals_page.dart';
// import '../Screens/Main Sixx Pages/products_page.dart';
// import '../bloc/profile/profile_bloc.dart';

// class BottomMenu_Page extends StatefulWidget {
//   BottomMenu_Page({Key? key}) : super(key: key);

//   @override
//   State<BottomMenu_Page> createState() => _BottomMenu_PageState();
// }

// class _BottomMenu_PageState extends State<BottomMenu_Page> {
//   // bool _isVisible = true;
//   // late ScrollController controller;

//   @override
//   void initState() {
//     context.read<ProfileBloc>().add(Load_Profile());
//     context.read<ProfileBloc>().add(Load_Address());
   
//     super.initState();
//     // controller = ScrollController();
//     // controller.addListener(() {
//     //   setState(() {
//     //     _isVisible =
//     //         controller.position.userScrollDirection == ScrollDirection.forward;
//     //   });
//     // });
//   }

//   List<Widget> _widgetsPages = [
//     NewsFeedPage(),
//     StorePage(),
//     HomePage(),
//     AnimalsPage(),
//     ProductsPage(),
//     ProfilePage2()
//   ];

//   int _index = 2;
//   void onItemTapped555(int index2) {
//     setState(() {
//       _index = index2;
//     });
//   }

//   // String k = '';
//   // Future loginh() async {
//   //   SharedPreferences prefs2 = await SharedPreferences.getInstance();
//   //   var x = prefs2.get('keyToken');
//   //   setState(() {
//   //     k = x.toString();
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetsPages.elementAt(_index),
//       bottomNavigationBar: Container(
//         height: MediaQuery.of(context).size.height * 0.08,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//           boxShadow: [
//             BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _index,
//           onTap: onItemTapped555,
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               activeIcon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab1.svg",
//                   color: ZeleexColor.zeleexGreen,
//                 ),
//               ),
//               icon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab1.svg",
//                 ),
//               ),
//               label: 'นิวส์ฟีด',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab2.svg",
//                   color: ZeleexColor.zeleexGreen,
//                 ),
//               ),
//               icon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab2.svg",
//                 ),
//               ),
//               label: 'ร้านค้า',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab3.svg",
//                   color: ZeleexColor.zeleexGreen,
//                 ),
//               ),
//               icon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab3.svg",
//                 ),
//               ),
//               label: 'หน้าหลัก',
//             ),
//             BottomNavigationBarItem(
//               icon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab4.svg",
//                 ),
//               ),
//               activeIcon: SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/images/new/tab4.svg",
//                   color: ZeleexColor.zeleexGreen,
//                 ),
//               ),
//               label: 'สัตว์',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SvgPicture.asset(
//                 "assets/images/new/tab5.svg",
//                 color: ZeleexColor.zeleexGreen,
//               ),
//               icon: SvgPicture.asset(
//                 "assets/images/new/tab5.svg",
//               ),
//               label: 'สินค้า',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SvgPicture.asset(
//                 "assets/images/new/tab6.svg",
//                 color: ZeleexColor.zeleexGreen,
//               ),
//               icon: SvgPicture.asset(
//                 "assets/images/new/tab6.svg",
//               ),
//               label: 'โพรไฟล์',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
