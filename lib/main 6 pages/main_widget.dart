import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:zeleex_application/cart.dart';
import 'package:zeleex_application/profile.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';

class Main_Widget extends StatefulWidget {
  Main_Widget({Key? key}) : super(key: key);

  @override
  State<Main_Widget> createState() => _Main_WidgetState();
}

class _Main_WidgetState extends State<Main_Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Palette.kToDark,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                  child: SvgPicture.asset(
                'assets/images/menu.svg',
                color: Color.fromARGB(255, 255, 255, 255),
              )),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ImageIcon(
              //           AssetImage(
              //             "assets/images/menu-61.png",
              //           ),
              //         ),
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
              Text(
                "หน้าหลัก",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: SvgPicture.asset(
                  'assets/images/cart123.svg',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Palette.kToDark,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/images/search.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "serch for cattles...",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 130, 130, 130),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Text(
                                  "ค้นหา",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImageSlideshow(
                        initialPage: 0,
                        indicatorColor: Palette.kToDark,
                        indicatorBackgroundColor: Colors.grey,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Image.asset(
                            'assets/images/slide1.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/slide1.png',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/images/slide1.png',
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/cow.svg',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "โคเนื้อ",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/cowmilk.svg',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("โคนม", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/buff.svg',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("กระบือ", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/cum.svg',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("น้ำเชื้อ", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/thing.svg',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("อุปกรณ์", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/food.svg',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("อาหารและยา",
                                    style: TextStyle(fontSize: 12))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    10,
                                    10,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    "โคและกระบือ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF10C19F),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      "ดูทั้งหมด",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // in cloumn
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            child: Image.asset(
                                                'assets/images/cattles1.png'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cattles1",
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "฿ 170,000",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            child: Image.asset(
                                                'assets/images/cattles2.png'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cattles2",
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "฿ 100,000",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            child: Image.asset(
                                              'assets/images/cattles3.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cattles3",
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "฿ 90,000",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          10,
                                          10,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          "สินค้า",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 0),
                                        child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF10C19F),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            "ดูทั้งหมด",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  // in cloumn
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        //main axis (rows or columns)

                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: Image.asset(
                                                        'assets/images/pd1.png'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Cattles1",
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "฿ 170",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 17, 0)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: Image.asset(
                                                        'assets/images/pd2.png'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Cattles2",
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "฿ 100",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 17, 0)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: Image.asset(
                                                      'assets/images/pd3.png',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Cattles3",
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "฿ 90",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 17, 0)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
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
    );
  }
}
