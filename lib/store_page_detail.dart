import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Plate.dart';
import 'main 6 pages/store_page.dart';
import 'store_page_detail_cattle.dart';
import 'store_page_detail_product.dart';

class Store_Detail extends StatefulWidget {
  Store_Detail({Key? key}) : super(key: key);

  @override
  State<Store_Detail> createState() => _Store_DetailState();
}

class _Store_DetailState extends State<Store_Detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Store_ProductPage()),
                    )
                  },
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/instore.svg',
                          color: Palette.kToDark,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "สินค้าในร้าน",
                          style: TextStyle(color: Palette.kToDark),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 150,
                child: FloatingActionButton(
                  backgroundColor: Palette.kToDark,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Store_CattlePage()),
                    )
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/malfoot.svg',
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("หมวดหมู่สัตว์")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage(
                        "assets/images/menu-61.png",
                      ),
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
                Text("ร้านค้า",
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/sort.svg',
                    ),
                    SvgPicture.asset(
                      'assets/images/cart123.svg',
                    )
                  ],
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image.asset('assets/images/image11.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 80, 8, 0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  "assets/images/img.png")),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 5, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/pinnew.svg'),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 200,
                                                    child: Text(
                                                      "11/1-23 ม.3 ต.หนองไทร อ.พุมพิน จ. สุราษฎธานี 84100",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/callnew.svg'),
                                                  // ImageIcon(
                                                  //   AssetImage(
                                                  //     "assets/images/phone.png",
                                                  //   ),
                                                  //   color: Colors.grey,
                                                  // ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "081 235 1234",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/star.svg'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print("object");
                                            },
                                            child: Container(
                                              width: 70,
                                              padding: EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                color: Palette.kToDark,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Text(
                                                "ติดตาม",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "ประเภทร้านค้า: ร้านค้าทั่วไป, บริการขนส่งสัตว์",
                                            style: TextStyle(
                                                color: Palette.kToDark),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                        color:
                                            Color.fromARGB(255, 165, 162, 162)),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "อาหารวัวทอง สำหรับโคเนื้อ โคขุน โคเม กินดี อ้วนไว ไม่แพง",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/images/detail1.png',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/images/detail2.png',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/images/detail3.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
