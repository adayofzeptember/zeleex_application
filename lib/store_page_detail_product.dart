import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20By%20ID/store_id_api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'Plate.dart';
import 'store_page_detail.dart';
import 'store_page_detail_productDetail.dart';

class Store_ProductPage extends StatefulWidget {
  String storeID = "";
  Store_ProductPage({Key? key, required this.storeID}) : super(key: key);

  @override
  State<Store_ProductPage> createState() => _Store_ProductPageState();
}

class _Store_ProductPageState extends State<Store_ProductPage> {
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
          // leading: Builder(
          //   builder: (context) => IconButton(
          //     icon: SizedBox(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: ImageIcon(
          //           AssetImage(
          //             "assets/images/menu-61.png",
          //           ),
          //           color: Color.fromARGB(255, 51, 51, 51),
          //         ),
          //       ),
          //     ),
          //     onPressed: () => Scaffold.of(context).openDrawer(),
          //   ),
          // ),
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
              Text("สินค้าในร้าน",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  // SvgPicture.asset(
                  //   'assets/images/sort.svg',
                  // ),
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
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
                    //   child: Center(
                    //     child: Container(
                    //       width: double.infinity,
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.only(
                    //               topRight: Radius.circular(10),
                    //               topLeft: Radius.circular(10))),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(20.0),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 SizedBox(
                    //                   height: 50,
                    //                   width: 50,
                    //                   child: CircleAvatar(
                    //                       child: Image.asset(
                    //                           "assets/images/img.png")),
                    //                 ),
                    //                 Padding(
                    //                   padding: const EdgeInsets.fromLTRB(
                    //                       10, 0, 5, 0),
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text("ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์w",
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.bold)),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       Row(
                    //                         children: [
                    //                           ImageIcon(
                    //                             AssetImage(
                    //                               "assets/images/store_pin.png",
                    //                             ),
                    //                             color: Colors.grey,
                    //                           ),
                    //                           Container(
                    //                             width: 200,
                    //                             child: Text(
                    //                               "11/1-23 ม.3 ต.หนองไทร อ.พุมพิน จ. สุราษฎธานี 84100",
                    //                               style: TextStyle(
                    //                                   color: Colors.grey,
                    //                                   fontSize: 13),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       Row(
                    //                         children: [
                    //                           ImageIcon(
                    //                             AssetImage(
                    //                               "assets/images/phone.png",
                    //                             ),
                    //                             color: Colors.grey,
                    //                           ),
                    //                           Container(
                    //                             width: 200,
                    //                             child: Text(
                    //                               "081 235 1234",
                    //                               style: TextStyle(
                    //                                   color: Colors.grey,
                    //                                   fontSize: 13),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 Icon(
                    //                   Icons.settings,
                    //                   color: Colors.white,
                    //                 )
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             Padding(
                    //               padding:
                    //                   const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    //               child: Row(
                    //                 children: [
                    //                   Image.asset("assets/images/star.png"),
                    //                   Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                    //                   SizedBox(
                    //                     width: 10,
                    //                   ),
                    //                   ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                         shape: RoundedRectangleBorder(
                    //                           borderRadius:
                    //                               BorderRadius.circular(30),
                    //                         ),
                    //                         primary: pressed
                    //                             ? Palette.kToDark
                    //                             : Color.fromARGB(
                    //                                 255, 204, 204, 204),
                    //                         elevation: 0),
                    //                     onPressed: () {
                    //                       setState(() {
                    //                         pressed = !pressed;
                    //                       });
                    //                     },
                    //                     //         style: pressed
                    //                     // ? TextStyle(
                    //                     //     color: Colors.black)
                    //                     // : TextStyle(
                    //                     //     color: Color.fromARGB(255, 229, 233, 229)),
                    //                     child: Text(
                    //                       pressed ? "ติดตาม" : "ติดตามแล้ว",
                    //                       style: TextStyle(
                    //                           color: Color.fromRGBO(
                    //                               255, 255, 255, 1)),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding:
                    //                   const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    //               child: Row(
                    //                 children: [
                    //                   Text(
                    //                     "ประเภทร้านค้า: ร้านค้าทั่วไป, บริการขนส่งสัตว์",
                    //                     style:
                    //                         TextStyle(color: Palette.kToDark),
                    //                   ),
                    //                   SizedBox(
                    //                     width: 10,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             Divider(
                    //                 color: Color.fromARGB(255, 165, 162, 162)),
                    //             Padding(
                    //               padding:
                    //                   const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    //               child: Row(
                    //                 children: [
                    //                   Text(
                    //                     "อาหารวัวทอง สำหรับโคเนื้อ โคขุน โคเม กินดี อ้วนไว ไม่แพง",
                    //                     style: TextStyle(color: Colors.grey),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height: 5),
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
                                "อุปกรณ์",
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
                              "อาหารและยา",
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
                              "น้ำเชื้อและตัวอ่อdน",
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
                  height: 5,
                ),







                //! ดึงสินค้ามาโชว์ GRID




                Center(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Store_Product_Detail()),
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
                                          'assets/images/product1.png',
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        height: 40,
                                        child: Text(
                                          "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
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
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
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
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 0, 0),
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
          ],
        ),
      ),
    );
  }
}
