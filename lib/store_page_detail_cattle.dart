import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20By%20ID/store_id_api.dart';
import 'Plate.dart';
import 'store_page_detail.dart';
import 'store_page_detail_cattleDetail.dart';

class Store_CattlePage extends StatefulWidget {
  String storeID = "";

  Store_CattlePage({Key? key, required this.storeID}) : super(key: key);

  @override
  State<Store_CattlePage> createState() => _Store_CattlePageState();
}

class _Store_CattlePageState extends State<Store_CattlePage> {
  bool pressed = true;

  Future<Data_Store> fetchStore_ByID() async {
    var url = "https://sanboxapi.zeleex.com/api/stores/" + widget.storeID;
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data'];
    Data_Store msg = Data_Store.fromJson(jsonCon);
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Text("หมวดหมู่สัตว์",
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
            Column(
              children: [
                Stack(
                  children: [
                    FutureBuilder(
                        future: fetchStore_ByID(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            Data_Store thisStore = snapshot.data;
                            return Image.network(
                                thisStore.imageCover!.main.toString());
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        }),
                    FutureBuilder(
                        future: fetchStore_ByID(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            Data_Store thisStore_notCoverIMG = snapshot.data;
                            return Container(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              child: CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 131, 131, 131),
                                                backgroundImage: NetworkImage(
                                                    thisStore_notCoverIMG
                                                        .image!.thumbnail
                                                        .toString()),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 5, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    thisStore_notCoverIMG.title
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/images/pinnew.svg'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      //width: MediaQuery.of(context).size.width * 0.5,
                                                      child: Text(
                                                        thisStore_notCoverIMG
                                                            .address
                                                            .toString(),
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
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        thisStore_notCoverIMG
                                                            .phone
                                                            .toString(),
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
                                              width: 5,
                                            ),
                                            Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  primary: pressed
                                                      ? Palette.kToDark
                                                      : Color.fromARGB(
                                                          255, 204, 204, 204),
                                                  elevation: 0),
                                              onPressed: () {
                                                setState(() {
                                                  pressed = !pressed;
                                                });
                                              },
                                              //         style: pressed
                                              // ? TextStyle(
                                              //     color: Colors.black)
                                              // : TextStyle(
                                              //     color: Color.fromARGB(255, 229, 233, 229)),
                                              child: Text(
                                                pressed
                                                    ? "ติดตาม"
                                                    : "ติดตามแล้ว",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //! แก้ไขเพิ่มเติม
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 0),
                                        child: Row(
                                          children: <Widget>[
                                            Text("ประเภทร้านค้า "),
                                            Container(
                                              height: 20,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      thisStore_notCoverIMG
                                                          .types!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      children: [
                                                        Text(
                                                          thisStore_notCoverIMG
                                                                  .types![index]
                                                                  .title
                                                                  .toString() +
                                                              ", ",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                          color: Color.fromARGB(
                                              255, 165, 162, 162)),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          thisStore_notCoverIMG.content
                                              .toString(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        })
                  ],
                ),
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
                              //MediaQuery.of(context).size.height * 0.25
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "โคนม",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Palette.kToDark,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "โคเนื้อ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "อาหารและยา",
                              style: TextStyle(
                                  fontSize: 12,
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Store_Cattle_Detail(),
                                ),
                              );
                            },
                            child: Container(
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
                                          'assets/images/alpine-cow.png',
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        child: Text(
                                          "จ้าวทศพล (YZ116) แบรนด์ดี",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        height: 30,
                                        child: Text(
                                          "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 130, 130, 130)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 0, 0),
                                        child: Text(
                                          "฿ 8900",
                                          style: TextStyle(color: Colors.red),
                                        )),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Image.asset(
                                        'assets/images/alpine-cow.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                                        'assets/images/alpine-cow.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                                        'assets/images/alpine-cow.png',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      child: Text(
                                        "จ้าวทศพล (YZ116) แบรนด์ดี",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
