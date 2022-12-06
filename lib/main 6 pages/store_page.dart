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

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final controller = ScrollController();
  //*ค่าเริ่มต้น แสดง 2 items

  bool press = false;
  String test = 'https://admin.zeleex.com/api/stores?per_page=15&page=';
  String typeID = "";
  List data = [];
  final scrollController = ScrollController();
  int page = 1;
  bool isLoadingMore = false;

  late Future<List<Data_Store_Types>> futureStore_Types;

  @override
  void initState() {
    futureStore_Types = fetch_store_types();
    fetch_StorePage_readAll();
    scrollController.addListener(_scrollListener);
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
      body: RawScrollbar(
        controller: controller,
        thumbColor: Palette.kToDark,
        radius: Radius.circular(50),
        thickness: 5,
        child: GridView.builder(
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.36,
            ),
            controller: scrollController,
            itemCount: isLoadingMore ? data.length + 1 : data.length,
            itemBuilder: (context, index) {
              if (index < data.length) {
                final post = data[index];
                //final stoer_id = post
                final title = post['title'];

                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Store_Detail(
                                  storeID: post['id'].toString(),
                                  storeName: post['title'].toString(),
                                )),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            child: CachedNetworkImage(
                              imageUrl: post['image']['thumbnail'].toString(),
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                color: Color.fromARGB(255, 142, 142, 142),
                                // height: 200,
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Image.asset(
                                  'assets/images/store-noimg.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Text(
                            post['title'].toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 51, 51, 51)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset(
                                    'assets/images/pinstore.svg'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                child: Text(
                                  post['address'].toString(),
                                  style: TextStyle(
                                      fontSize: 13, color: Palette.kToDark),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset('assets/images/star.svg'),
                              SizedBox(
                                width: 5,
                              ),
                              Text("5 คะแนน")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
                                        ),
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
                                              'https://admin.zeleex.com/api/products?per_page=';
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

  Future<void> fetch_StorePage_readAll() async {
    final response = await http.get(
      Uri.parse(test + page.toString()),
      // Uri.parse('https://admin.zeleex.com/api/stores?per_page=15&page=${page}'),
      headers: {'Accept': 'application/json'},
    );
    var jsonResponse = json.decode(response.body);
    final jsonCon = jsonResponse['data']['data'] as List;
    if (response.statusCode == 200) {
      setState(() {
        data = data + jsonCon;
      });
    } else {
      throw Exception("error...");
    }
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      page = page + 1;

      await fetch_StorePage_readAll();
      setState(() {
        isLoadingMore = false;
      });
    }
  }
}
