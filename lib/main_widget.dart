import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:zeleex_application/cart.dart';
import 'Career/career.dart';
import 'Plate.dart';
import 'aboutus.dart';
import 'help.dart';

class mainpageWidget_only extends StatelessWidget {
  const mainpageWidget_only({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return MyHomePage();
    return (MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber), home: Main_Widget()));
  }
}

class Main_Widget extends StatefulWidget {
  Main_Widget({Key? key}) : super(key: key);

  @override
  State<Main_Widget> createState() => _Main_WidgetState();
}

class _Main_WidgetState extends State<Main_Widget> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
          fontFamily: 'Kanit',
        ),
        home: Scaffold(
          appBar: AppBar(
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
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                          padding: const EdgeInsets.all(10.0),
                          // child: Image.asset(
                          //   'assets/images/slide1.png',
                          // ),
                          child: ImageSlideshow(
                            initialPage: 0,
                            indicatorColor: Palette.kToDark,
                            indicatorBackgroundColor: Colors.grey,
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.asset(
                                'assets/images/slide1.png',
                                fit: BoxFit.fill,
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(249, 255, 255, 255)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              20,
                                              0,
                                              0,
                                              0,
                                            ),
                                            child: Text(
                                              "โคและกระบือ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(15.0),
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
                                          )
                                        ],
                                      ),
                                      // in cloumn
                                      SizedBox(
                                        height: 20,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(249, 255, 255, 255)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              20,
                                              0,
                                              0,
                                              0,
                                            ),
                                            child: Text(
                                              "สินค้า",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 16, 193, 159),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Text(
                                              "ดูทั้งหมด",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            // main axis (rows or columns)
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        child: Image.asset(
                                                            'assets/images/pd1.png'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Product 1",
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "฿ 170",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        child: Image.asset(
                                                            'assets/images/pd2.png'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Product 2",
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "฿ 100",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        child: Image.asset(
                                                            'assets/images/pd2.png'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Product 3",
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "฿ 250",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                                  child: Icon(Icons.person),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name Surname",
                                          style: TextStyle(
                                              color: Palette.kToDark,
                                              fontFamily: 'Kanit')),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "ดูโปรไฟล์",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 165, 162, 162),
                                            fontFamily: 'Kanit'),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    "เกี่ยวกับเรา",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kanit'),
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
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
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
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
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
                                      builder: (context) => HelpCenter()));
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/new/help2.svg',
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                      builder: (context) => Career_Page()));
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/new/us.svg',
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
        )));
  }
}
