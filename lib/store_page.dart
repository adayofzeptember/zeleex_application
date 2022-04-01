import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Plate.dart';
import 'store_page_detail.dart';

void main() {
  runApp(StorePage_Run());
}

class StorePage_Run extends StatelessWidget {
  const StorePage_Run({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        // theme: ThemeData(
        //     primarySwatch: Colors.grey,
        //     appBarTheme:
        //         AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
        home: StorePage()));
  }
}

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int index = 1;
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
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                  child: SvgPicture.asset(
                    'assets/images/menu.svg',
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
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
                Text(
                  "ร้านค้า",
                  style: TextStyle(color: Palette.kToDark),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                    ],
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Wrap(
                  spacing: 4.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoreDetailPage(),
                                ));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => mainPage(),
                            //   ),
                            // );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store1.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "ศรีไพศาลอาหารสัตว์",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.สุราษฎ์ธานี",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store2.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "โกสินทร์ การเกษตร",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.เชียงใหม่",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store3.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "บริษัท นิวเจนแมน",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.นครราชสีมา",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store4.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "บีมเพ็ทช็อป",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.จันทบุรี",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store5.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "จั๋งดุ๋ การเกษตร",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.นนทบุรี",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store6.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "เชียงพังการเกษตร",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.อุดรธานี",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/store4.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text(
                                  "บีมเพ็ทช็อป",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/store_pin.png",
                                      ),
                                      color: Palette.kToDark,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "จ.จันทบุรี",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/images/dot.png",
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                        Row(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.person),
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
                                  Text(
                                    "ดูโปรไฟล์",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 165, 162, 162),
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
                        Row(
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
                                  style: TextStyle(color: Colors.white)),
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
                        Row(
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
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
      ),
    );
  }
}
