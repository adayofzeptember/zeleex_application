import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20All/filters/store_types.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/main%206%20pages/onlyMenuForMainPage_nothing_here.dart';
import 'package:zeleex_application/from%20Profile/profile.dart';
import 'package:expandable/expandable.dart';
import 'package:zeleex_application/main%206%20pages/store_filtered.dart';
import '../API/Read All/stores_API.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../second.dart';
import '../store_page_detail.dart';

var perPage = 10;
bool hasMore = true;
int x = 1;

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final controller = ScrollController();
  //*ค่าเริ่มต้น แสดง 2 items

  bool press = false;
  String test = 'https://api.zeleex.com/api/stores?per_page=';
  String typeID = "";

  late Future<List<Data_Store_ReadALL>> futureStore;
  late Future<List<Data_Store_Types>> futureStore_Types;

  Future<List<Data_Store_ReadALL>> fetch_StorePage_readAll() async {
    setState(() {
      x = x + 1;
    });
    // print(x.toString());
    final response = await http.get(
      Uri.parse(test.toString() + perPage.toString()),
      headers: {'Accept': 'application/json'},
    );
    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data']['data'];
    if (response.statusCode == 200) {
      if (jsonCon.length < perPage) {
        setState(() {
          hasMore = false;
        });
      }

      return jsonCon.map((data) => Data_Store_ReadALL.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
  }

  void initState() {
    fetch_StorePage_readAll();
    futureStore_Types = fetch_store_types();
    futureStore = fetch_StorePage_readAll();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          perPage = perPage + 4; //*เลื่อนลง + เพิ่มที่ละ 2 items
        });
        fetch_StorePage_readAll();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        leading: Builder(
          builder: (context) => IconButton(
            icon: SizedBox(
              child: Visibility(
                visible: false,
                child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text("ร้านค้า",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: SvgPicture.asset(
                  'assets/images/sort.svg',
                ),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return Text('data');
              }))
        ],
      ),
      endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white, //desired color
          ),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.3,
            child: Drawer(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Text("ค้นหาจากหมวดหมู่",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),

                      FutureBuilder<List<Data_Store_Types>>(
                        future: futureStore_Types,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Data_Store_Types>? data = snapshot.data;
                            return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              typeID =
                                                  data[index].id.toString();
                                            });
                                            print(typeID.toString());
                                          },
                                          child: Text(
                                              data[index].title.toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 131, 131, 131))),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Container();
                        },
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[

                      //     InkWell(
                      //       onTap: () {
                      //         setState(() {
                      //           press = !press;

                      //           typeID = "1";
                      //         });
                      //       },
                      //       child: Text("ร้านค้าทั่วไป",
                      //           style: TextStyle(
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.w500,
                      //               color: press
                      //                   ? Palette.kToDark
                      //                   : Color.fromARGB(255, 131, 131, 131))),
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         setState(() {
                      //           typeID = "2";
                      //           press = !press;
                      //         });
                      //       },
                      //       child: Text("ร้านค้าส่งสัตว์",
                      //           style: TextStyle(
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.w500,
                      //               color: press
                      //                   ? Color.fromARGB(255, 131, 131, 131)
                      //                   : Palette.kToDark)),
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         setState(() {
                      //           typeID = "3";
                      //           press = !press;
                      //         });
                      //       },
                      //       child: Text("บริการขนส่งน้ำเชื้อ",
                      //           style: TextStyle(
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.w500,
                      //               color: Color.fromARGB(255, 131, 131, 131))),
                      //     ),
                      //   ],
                      // ),

                      Spacer(),
                      Container(
                          //height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Row(children: <Widget>[
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.white,
                                        side:
                                            BorderSide(color: Palette.kToDark),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          test =
                                              'https://api.zeleex.com/api/products?per_page=';
                                        });
                                        initState();
                                      },
                                      child: Text(
                                        "ยกเลิก",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Store_Filtered(
                                                    typeID: typeID,
                                                  )));
                                    },
                                    child: Text("ตกลง",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                              ),
                            ]),
                          ))
                    ],
                  )),
            ),
          )),
    );
  }
}
