import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:zeleex_application/API/Read%20All/blogs_readall_api.dart';
import 'package:zeleex_application/API/Read%20All/home_getData_api.dart';
import 'package:zeleex_application/API/url.dart';
import 'package:zeleex_application/cart.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../newsfeed_detail.dart';
import '../from Profile/profile.dart';

class NewsFeedPage extends StatefulWidget {
  NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final controller = ScrollController();
  var perPage = 2; //*ค่าเริ่มต้น แสดง 2 items
  bool hasMore = true;
  bool isNull = false;
 

  void initState() {
    fetch_Blog_readAll();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          perPage = perPage + 2; //*เลื่อนลง + เพิ่มที่ละ 2 items
        });
        fetch_Blog_readAll();
      }
    });
    super.initState();
  }

  Future<List<Data_Blog_Detail>> fetch_Blog_readAll() async {
    final response = await http.get(Uri.parse(
        'https://api.zeleex.com/api/blogs?per_page=' + perPage.toString()));
    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data']['data'];
    if (jsonCon.length < perPage) {
      setState(() {
        hasMore = false;
      });
    }
    return jsonCon.map((data) => Data_Blog_Detail.fromJson(data)).toList();
  }

  Future refresh() async {
    setState(() {
      perPage = 2;
      hasMore = true;
    });

    await fetch_Blog_readAll();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
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
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: false,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Text(
                "นิวส์ฟีด",
                style: TextStyle(
                    color: Palette.kToDark, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(children: <Widget>[
          FutureBuilder<List<Data_Blog_Detail>>(
            future: fetch_Blog_readAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Blog_Detail>? data = snapshot.data;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                        controller: controller,
                        itemCount: data!.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < data.length) {
                            String get_Thetime =
                                data[index].createdAt.toString();
                  
                            var createdTime = DateFormat.yMMMd()
                                .format(DateTime.parse(get_Thetime));

                            String checkNull =
                                data[index].description.toString();
                            String realDesc;
                            if (checkNull == 'null') {
                              realDesc = '- อ่านรายละเอียดเพิ่มเติม -';
                            } else {
                              realDesc = data[index].description.toString();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  print(data[index].id.toString());
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NewsFeedPage_Detail(
                                            blogID: data[index].id.toString(),
                                          )));
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 20, 0, 0),
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: data[index]
                                                  .image!
                                                  .main
                                                  .toString(),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 141, 141, 141),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      CircleAvatar(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Palette.kToDark,
                                                ),
                                                backgroundColor: Color.fromARGB(
                                                    255, 224, 224, 224),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 5, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      data[index]
                                                          .store!
                                                          .title
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 51, 51, 51),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    createdTime,
                                                    // data[index]
                                                    //     .createdAt
                                                    //     .toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255,
                                                            165,
                                                            162,
                                                            162)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          imageUrl: data[index]
                                              .image!
                                              .main
                                              .toString(),
                                          width: double.infinity,
                                          fit: BoxFit.fitWidth,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Container(
                                            color: Color.fromARGB(
                                                255, 142, 142, 142),
                                            height: 200,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Center(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              141,
                                                              141,
                                                              141))),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      "ไม่พบรูปภาพของบล็อก")),
                                            ),
                                          ),
                                        ),

                                        // Image.network(
                                        //   data[index].image!.main.toString(),
                                        //   fit: BoxFit.cover,
                                        // )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data[index].title.toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontSize: 13.5,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                                child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/love.svg',
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/images/sharefeed.svg',
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Text(
                                          realDesc,
                                          // "แต่ถ้าเลี้ยงแบบครบวงจร ภาครัฐจัดหาน้ำเชื้อจากพ่อแม่พันธุ์ชั้นดีเกษตรกรนำมาผสมพันธุ์ แล้วเลี้ยงอนุบาลส่งต่อให้เกษตรกรที่พอมีกำลังทรัพย์นำมาขุนต่อด้วยเทคโนโลยีสมัยใหม่ ให้ ได้เนื้อวัวเกรดพรีเมียมมีไขมันแทรก ไม่ต่างจากเนื้อจากต่างประเทศราคาแพง",
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return hasMore
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Center(
                                      child: Text("...",
                                          style: TextStyle(
                                              color: Palette.kToDark)),
                                    ),
                                  );
                          }
                        }),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child:
                        Text("ไม่สามารถโหลดข้อมูลได้ โปรดตรวจสอบการเชื่อมต่อ"));
              }

              return Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(child: CircularProgressIndicator()),
              );
            },
          )
        ]),
      ),
    );
  }
}