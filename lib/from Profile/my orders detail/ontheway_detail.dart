import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Plate.dart';

class Order_ontheway_Detail extends StatefulWidget {
  Order_ontheway_Detail({Key? key}) : super(key: key);

  @override
  State<Order_ontheway_Detail> createState() => _Order_ontheway_DetailState();
}

class _Order_ontheway_DetailState extends State<Order_ontheway_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                ),
              ),
              Text(
                "รายละเอียดคำสั่งซื้อ",
                style: TextStyle(
                    color: Palette.kToDark, fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                'assets/images/392.svg',
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Palette.kToDark,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "กำลังจัดส่งสินค้า",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "ได้รับสินค้าายในวันที่",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "19-04-2022",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/373.svg',
                            ),
                          ],
                        ),
                      )),
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/pin.svg'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "ที่อยู่สำหรับจัดส่ง",
                            style: TextStyle(
                                color: Color.fromARGB(255, 51, 51, 51),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "ชวันธร วีรจรรยาพันธ์",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Container(
                            width: 250,
                            child: Text(
                              "087-571-2533",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 130, 130, 130),
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Container(
                            width: 250,
                            child: Text(
                              "369/11 เดชอุดม ซอย 6 ตำบลในเมือง อำเภอเมือง จังหวัดนครราชสีมา 30000",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                color: Color.fromARGB(255, 130, 130, 130),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/cart_store.svg',
                                    color: Color.fromARGB(255, 104, 104, 104),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Zeleex Shop",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "ไปหน้าร้านค้า >",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 51, 51, 51),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  'assets/images/cart_pd.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "ยารักษาโรคติดเชื้อแบคทีเรีย",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                        ),
                                      ),
                                      Text(
                                        "ตัวเลือก: มทส016",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 141, 141, 141)),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "฿1,300",
                                            style: TextStyle(
                                                color: Palette.kToDark,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "จำนวน: 1",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Divider(
                                color: Color.fromARGB(255, 227, 228, 227)),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  'assets/images/cart_pd.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "ยารักษาโรคติดเชื้อแบคทีเรีย",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                        ),
                                      ),
                                      Text(
                                        "ตัวเลือก: มทส016",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 141, 141, 141)),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "฿1,300",
                                            style: TextStyle(
                                                color: Palette.kToDark,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "จำนวน: 1",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "หมายเลขคำสั่งซื้อ: 2261205848132959",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.copy, color: Palette.kToDark, size: 15,),
                                  SizedBox(width: 2,),
                                  Text(
                                    "คัดลอก",
                                    style: TextStyle(
                                        color: Palette.kToDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("วันที่สั่งซื้อสินค้า"),
                              Text("19-03-2022  19:20")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                                color: Color.fromARGB(255, 227, 228, 227)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("ยอดรวมสินค้า"), Text("฿1,000")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("ค่าจัดส่ง"), Text("฿45")],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("รวมการสั่งซื้อ",
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                "฿2,455",
                                style: TextStyle(
                                    color: Palette.kToDark, fontSize: 20),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                                color: Color.fromARGB(255, 227, 228, 227)),
                          ),
                          Container(
                              width: double.infinity,
                              child: Row(children: <Widget>[
                                Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          side: BorderSide(
                                              color: Palette.kToDark),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "ติดต่อร้านค้า",
                                          style:
                                              TextStyle(color: Palette.kToDark),
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("ได้รับสินค้าแล้ว",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))),
                                )
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
