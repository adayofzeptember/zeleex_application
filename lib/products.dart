import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'Plate.dart';

void main(List<String> args) {
  runApp(Product_Page());
}

class Product_Page extends StatelessWidget {
  const Product_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pd_widget(),
    );
  }

  
}

class pd_widget extends StatefulWidget {
  pd_widget({Key? key}) : super(key: key);

  @override
  State<pd_widget> createState() => _pd_widgetState();
}

class _pd_widgetState extends State<pd_widget> {
  int index = 4;
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
                  child: Text("สินค้า", style: TextStyle(color: Palette.kToDark)),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/sort.svg',
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                        color: Color.fromARGB(255, 51, 51, 51),
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
                height: 10,
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
                          },
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "อุปกรณ์",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Palette.kToDark,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "อาหารและยา",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "น้ำเชื้อและตัวอ่อน",
                            style: TextStyle(
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
              SizedBox(
                height: 10,
              ),
              Center(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    child: Image.asset(
                                      'assets/images/product1.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 51, 51, 51),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
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
                        Container(
                          width: 190,
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
                                      'assets/images/product2.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัวมทส",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "฿ 350",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 190,
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
                                      'assets/images/product3.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "รางอาหารวัว พร้อมขาเหล็ก",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
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
                        Container(
                          width: 190,
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
                                      'assets/images/product4.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "อยากำจัดพยาธิ xxxx",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "฿ 350",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 190,
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
                                      'assets/images/product5.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัวมทส",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "฿ 350",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 190,
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
                                      'assets/images/product6.png',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 40,
                                    child: Text(
                                      "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัวมทส",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "฿ 350",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                                        style: TextStyle(color: Palette.kToDark, fontFamily: 'Kanit' )),
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
                                  style: TextStyle(color: Colors.white, fontFamily: 'Kanit' ),
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
                                child: Text("เกี่ยวกับเรา",
                                    style: TextStyle(color: Colors.white, fontFamily: 'Kanit' ),
                              ),
                              )],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("ภายในร้าน",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 165, 162, 162), fontFamily: 'Kanit' )),
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
                                    style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text("ร้านค้า",
                                      style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
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
                                    style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("การช่วยเหลือ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 165, 162, 162), fontFamily: 'Kanit' )),
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
                                    style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
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
                                    style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text("ออกจากระบบ",
                                      style: TextStyle(color: Colors.white, fontFamily: 'Kanit' )),
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