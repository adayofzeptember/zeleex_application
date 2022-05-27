import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20All/animals_API.dart';
import 'API/Read By ID/store_id_api.dart';
import 'Plate.dart';
import 'main 6 pages/store_page.dart';
import 'store_page_detail_cattle.dart';
import 'store_page_detail_product.dart';

class Store_Detail extends StatefulWidget {
  String storeID = "";
  String storeName = "";
  Store_Detail({Key? key, required this.storeID, required this.storeName})
      : super(key: key);

  @override
  State<Store_Detail> createState() => _Store_DetailState();
}

class _Store_DetailState extends State<Store_Detail> {
  Future<Data_Store> fetchStore_ByID() async {
    var url = "https://sanboxapi.zeleex.com/api/stores/" + widget.storeID;
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data'];
    Data_Store msg = Data_Store.fromJson(jsonCon);
    return msg;
  }

  bool pressed = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.white,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Store_ProductPage(
                                storeID: widget.storeID,
                              )),
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
                width: MediaQuery.of(context).size.width * 0.4,
                child: FloatingActionButton(
                  heroTag: "bt1",
                  backgroundColor: Palette.kToDark,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Store_CattlePage(  storeID: widget.storeID,)),
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
            // leading: Builder(
            //   builder: (context) => IconButton(
            //     icon: SizedBox(
            //       child: Padding(
            //         paddin g: const EdgeInsets.all(8.0),
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
            Text(widget.storeName.toString(),
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
            children: <Widget>[
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
                                child:
                                    Center(child: CircularProgressIndicator()),
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
                                padding:
                                    const EdgeInsets.fromLTRB(8, 100, 8, 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 131, 131, 131),
                                                  backgroundImage: NetworkImage(
                                                      thisStore_notCoverIMG
                                                          .image!.thumbnail
                                                          .toString()),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 5, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      thisStore_notCoverIMG
                                                          .title
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              color:
                                                                  Colors.grey,
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
                                                              color:
                                                                  Colors.grey,
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
                                              Text(
                                                  " 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                        padding: const EdgeInsets.fromLTRB(15,5,0,0),
                                        child: Row(
                                          children: <Widget>[
                                            Text("ประเภทร้านค้า "),
                                            Container(
                                              height: 20,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: thisStore_notCoverIMG
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
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          child: Image.asset(
                                            'assets/images/detail1.png',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          child: Image.asset(
                                            'assets/images/detail2.png',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          child: Image.asset(
                                            'assets/images/detail3.png',
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                          })
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
                      //   child: Container(
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.only(
                      //             topRight: Radius.circular(10),
                      //             topLeft: Radius.circular(10))),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(20.0),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.center,
                      //             children: [
                      //               SizedBox(
                      //                 height: 50,
                      //                 width: 50,
                      //                 child: CircleAvatar(
                      //                     child: Image.asset(
                      //                         "assets/images/img.png")),
                      //               ),
                      //               Padding(
                      //                 padding: const EdgeInsets.fromLTRB(
                      //                     10, 0, 5, 0),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                         "ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
                      //                         style: TextStyle(
                      //                             fontWeight:
                      //                                 FontWeight.bold)),
                      //                     SizedBox(
                      //                       height: 5,
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         SvgPicture.asset(
                      //                             'assets/images/pinnew.svg'),
                      //                         SizedBox(
                      //                           width: 10,
                      //                         ),
                      //                         Container(
                      //                           width: 200,
                      //                           child: Text(
                      //                             "11/1-23 ม.3 ต.หนองไทร อ.พุมพิน จ. สุราษฎธานี 84100",
                      //                             style: TextStyle(
                      //                                 color: Colors.grey,
                      //                                 fontSize: 13),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     SizedBox(
                      //                       height: 5,
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         SvgPicture.asset(
                      //                             'assets/images/callnew.svg'),
                      //                         // ImageIcon(
                      //                         //   AssetImage(
                      //                         //     "assets/images/phone.png",
                      //                         //   ),
                      //                         //   color: Colors.grey,
                      //                         // ),
                      //                         SizedBox(
                      //                           width: 10,
                      //                         ),
                      //                         Container(
                      //                           child: Text(
                      //                             "081 235 1234",
                      //                             style: TextStyle(
                      //                                 color: Colors.grey,
                      //                                 fontSize: 13),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               Icon(
                      //                 Icons.settings,
                      //                 color: Colors.white,
                      //               )
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: 10,
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.fromLTRB(
                      //                 15, 0, 0, 0),
                      //             child: Row(
                      //               children: [
                      //                 SvgPicture.asset(
                      //                     'assets/images/star.svg'),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 ElevatedButton(
                      //                   style: ElevatedButton.styleFrom(
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(30),
                      //                       ),
                      //                       primary: pressed
                      //                            Palette.kToDark
                      //                           : Color.fromARGB(
                      //                               255, 204, 204, 204),
                      //                       elevation: 0),
                      //                   onPressed: () {
                      //                     setState(() {
                      //                       pressed = !pressed;
                      //                     });
                      //                   },
                      //                   //         style: pressed
                      //                   // ? TextStyle(
                      //                   //     color: Colors.black)
                      //                   // : TextStyle(
                      //                   //     color: Color.fromARGB(255, 229, 233, 229)),
                      //                   child: Text(
                      //                     pressed ? "ติดตาม" : "ติดตามแล้ว",
                      //                     style: TextStyle(
                      //                         color: Color.fromRGBO(
                      //                             255, 255, 255, 1)),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.fromLTRB(
                      //                 15, 10, 0, 0),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   "ประเภทร้านค้า: ร้านค้าทั่วไป, บริการขนส่งสัตว์",
                      //                   style: TextStyle(
                      //                       color: Palette.kToDark),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 10,
                      //           ),
                      //           Divider(
                      //               color:
                      //                   Color.fromARGB(255, 165, 162, 162)),
                      //           Padding(
                      //             padding: const EdgeInsets.fromLTRB(
                      //                 0, 10, 0, 0),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   "อาหารวัวทอง สำหรับโคเนื้อ โคขุน โคเม กินดี อ้วนไว ไม่แพง",
                      //                   style:
                      //                       TextStyle(color: Colors.grey),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 20,
                      //           ),
                      //           ClipRRect(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(8)),
                      //             child: Image.asset(
                      //               'assets/images/detail1.png',
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           ClipRRect(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(8)),
                      //             child: Image.asset(
                      //               'assets/images/detail2.png',
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           ClipRRect(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(8)),
                      //             child: Image.asset(
                      //               'assets/images/detail3.png',
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
