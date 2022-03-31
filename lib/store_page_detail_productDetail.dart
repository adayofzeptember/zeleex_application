import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


import 'Plate.dart';
import 'store_page_detail_product.dart';

//backgroundColor: Colors.transparent,

void main(List<String> args) {
  runApp(Store_ProductDetail());
}

class Store_ProductDetail extends StatelessWidget {
  const Store_ProductDetail({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: store_productsDetail_widget()));
  }
}

class store_productsDetail_widget extends StatefulWidget {
  store_productsDetail_widget({Key? key}) : super(key: key);

  @override
  State<store_productsDetail_widget> createState() =>
      _store_productsDetail_widgetState();
}

class _store_productsDetail_widgetState
    extends State<store_productsDetail_widget> {
  int index = 0;
  void _onItemTapped(int index2) {
    setState(() {
      index = index2;
    });
  }

  int _counter = 0;
  void _pluss() {
    setState(() {
      _counter++;
    });
  }

  void _minus() {
    setState(() {
      _counter--;
      if (_counter <= 0) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Colors.white)),
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
                  onPressed: () => {print("object")},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/newcart.svg',
                        color: Palette.kToDark,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "เพิ่มในตะกร้า",
                        style: TextStyle(color: Palette.kToDark),
                      )
                    ],
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
                  onPressed: () => {print("object")},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/dollar-circle.svg'),
                      SizedBox(
                        width: 5,
                      ),
                      Text("ซื้อสินค้า")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                  child: Container(
                      color: Color.fromARGB(117, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/images/menu.svg',
                            color: Colors.white),
                      )),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StoreDetailProductPage()),
                    );
                  },
                  child: Container(
                    color: Color.fromARGB(117, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          color: Color.fromARGB(117, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/images/sort.svg',
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          color: Color.fromARGB(117, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/images/cart123.svg',
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset('assets/images/image21.png'),
            Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัว มทส",
                            style: TextStyle(
                                color: Color.fromARGB(255, 51, 51, 51),
                                fontSize: 18),
                          ),
                          SvgPicture.asset('assets/images/love.svg')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "฿ 350",
                            style:
                                TextStyle(color: Colors.red[400], fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "฿ 250",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/images/groupStar.svg'),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    _minus();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/minus.svg',
                                    width: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 130, 130, 130)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${_counter}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    _pluss();
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/pluss.svg')),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                          child: Image.asset("assets/images/img.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/store_pin.png",
                                ),
                                color: Colors.grey,
                              ),
                              Container(
                                child: Text(
                                  "จ. สุราษฎธานี",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/phone.png",
                                ),
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "081 235 1234",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Container(
                                      width: 80,
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Palette.kToDark,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Text(
                                        "ติดตาม",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SvgPicture.asset('assets/images/vec.svg')],
                    ),
                    Text(
                      "รายละเอียดสินค้า",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัวมทสอาหารอัดเม็ดไม่เป็นฝุ่นทำให้คุณค่าทางอาหารอยู่ครบถ้วนแน่นอน",
                      style:
                          TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     // Add your onPressed code here!
            //   },
            //   child: const Icon(Icons.navigation),
            // ),
          ],
        )),
        // bottomNavigationBar: Container(
        //   height: 90,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(0), topLeft: Radius.circular(0)),
        //     boxShadow: [
        //       BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        //     ],
        //   ),
        //   child: BottomNavigationBar(
        //     currentIndex: 0,
        //     onTap: _onItemTapped,
        //     type: BottomNavigationBarType.fixed,
        //     items: <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Row(
        //           children: [SvgPicture.asset('assets/images/cart123.svg'), Text("data")],
        //         ),
        //         label: 'นิวส์ฟีด',
        //       ),
        //       BottomNavigationBarItem(
        //         activeIcon: SizedBox(
        //           child: SvgPicture.asset(
        //             "assets/images/new/tab2.svg",
        //             color: Palette.kToDark,
        //           ),
        //         ),
        //         icon: SizedBox(
        //           child: SvgPicture.asset(
        //             "assets/images/new/tab2.svg",
        //           ),
        //         ),
        //         label: 'ร้านค้า',
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}