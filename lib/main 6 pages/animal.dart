import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20All/animals_API.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/store_page_detail_cattleDetail.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import 'package:intl/intl.dart';
import '../from Profile/profile.dart';
import 'main_page.dart';

class AnimalsPage extends StatefulWidget {
  AnimalsPage({Key? key}) : super(key: key);

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  final controller = ScrollController();
  var perPage = 8; //*ค่าเริ่มต้น แสดง 2 items
  bool hasMore = true;
  void initState() {
    fetch_AnimalPage_readAll();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          perPage = perPage + 4; //*เลื่อนลง + เพิ่มที่ละ 2 items
        });
      }
    });
    super.initState();
  }

  Future<http.Response> createAlbum(String title) {
    return http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
  }

  Future<List<Data_Animal_ReadAll>> fetch_AnimalPage_readAll() async {
    final response = await http.get(Uri.parse(
        'https://sanboxapi.zeleex.com/api/animals?per_page=' +
            perPage.toString()));
    var jsonResponse = json.decode(response.body);

    List jsonCon = jsonResponse['data']['data'];

    if (response.statusCode == 200) {
      if (jsonCon.length < perPage) {
        setState(() {
          hasMore = false;
        });
      }
      return jsonCon.map((data) => Data_Animal_ReadAll.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
  }

  bool pressed = true;
  bool pressed2 = true;

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
        leading: Visibility(
          visible: false,
          child: Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                  child: SvgPicture.asset(
                'assets/images/menu.svg',
                color: Color.fromARGB(255, 51, 51, 51),
              )),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
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
              child: Text("สัตว์",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Palette.kToDark)),
            ),
            Container()
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
              // onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
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
                        setState(() {
                          pressed = !pressed;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: pressed ? Colors.white : Palette.kToDark,
                          border: pressed
                              ? Border.all(color: Colors.grey)
                              : Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "โคนม",
                          style: TextStyle(
                              color: pressed ? Colors.grey : Colors.white,
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

          FutureBuilder<List<Data_Animal_ReadAll>>(
            future: fetch_AnimalPage_readAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Animal_ReadAll>? data = snapshot.data;
                return Expanded(
                  child: RawScrollbar(
                    controller: controller,
                    thumbColor: Palette.kToDark,
                    radius: Radius.circular(50),
                    thickness: 5,
                    child: GridView.builder(
                      controller: controller,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.45),
                      ),
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data.length) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Store_Cattle_Detail(
                                          animalID: data[index].id.toString(),
                                          animalName:
                                              data[index].title.toString(),
                                        ),
                                      ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        child: CachedNetworkImage(
                                          imageUrl: data[index]
                                              .image!
                                              .thumbnail
                                              .toString(),
                                          fit: BoxFit.fill,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Container(
                                            color: Color.fromARGB(
                                                255, 142, 142, 142),
                                            // height: 200,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      3, 3, 3, 0),
                                              child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.22,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              211,
                                                              204,
                                                              204)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5))),
                                                  alignment: Alignment.center,
                                                  child: Text("ไม่พบรูปภาพ")),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        height: 20,
                                        child: Text(
                                          data[index].title.toString(),
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
                                          data[index].description.toString(),
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
                                          "฿ " +
                                              NumberFormat("#,###,###").format(
                                                  int.parse(data[index]
                                                      .price
                                                      .toString())),
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return hasMore
                              ? Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Center(
                                    child: Text("...",
                                        style:
                                            TextStyle(color: Palette.kToDark)),
                                  ),
                                );
                        }
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          ),

          //   Wrap(
          //     spacing: 0.0,
          //     runSpacing: 0.0,
          //     children: <Widget>[
          //       InkWell(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => Store_Cattle_Detail()));
          //         },
          //         child: Container(
          //           width: MediaQuery.of(context).size.width * 0.5,
          //           child: Card(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.0)),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 ClipRRect(
          //                     borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(5),
          //                         topRight: Radius.circular(5)),
          //                     child: Image.asset(
          //                       'assets/images/anm5.png',
          //                     )),
          //                 Padding(
          //                   padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
          //                   child: Container(
          //                     child: Text(
          //                       "จ้าวทศพล (YZ116) แบรนด์ดี",
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 51, 51, 51),
          //                           fontSize: 13,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
          //                   child: Container(
          //                     height: 30,
          //                     child: Text(
          //                       "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
          //                       style: TextStyle(
          //                           fontSize: 10,
          //                           color: Color.fromARGB(255, 130, 130, 130)),
          //                     ),
          //                   ),
          //                 ),
          //                 Padding(
          //                     padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
          //                     child: Text(
          //                       "฿ 8900",
          //                       style: TextStyle(color: Colors.red),
          //                     )),
          //                 SizedBox(
          //                   height: 8,
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
        ],
      ),
      // drawer: Theme(
      //     data: Theme.of(context).copyWith(
      //       canvasColor: Color.fromARGB(232, 36, 28, 28), //desired color
      //     ),
      //     child: Container(
      //       width: 250,
      //       child: Drawer(
      //         child: Padding(
      //           padding: const EdgeInsets.fromLTRB(
      //             20,
      //             0,
      //             0,
      //             0,
      //           ),
      //           child: Container(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 SizedBox(
      //                   height: 50,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => ProfilePage()));
      //                   },
      //                   child: Row(
      //                     children: [
      //                       CircleAvatar(
      //                         backgroundColor: Colors.white,
      //                         child: Icon(
      //                           Icons.person,
      //                           color: Palette.kToDark,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text("Name Surename",
      //                                 style: TextStyle(
      //                                     color: Palette.kToDark,
      //                                     fontFamily: 'Kanit')),
      //                             SizedBox(
      //                               height: 5,
      //                             ),
      //                             Text(
      //                               "ดูโปรไฟล์",
      //                               style: TextStyle(
      //                                   color:
      //                                       Color.fromARGB(255, 165, 162, 162),
      //                                   fontFamily: 'Kanit'),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       Icon(
      //                         Icons.settings,
      //                         color: Colors.white,
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 50,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.pushReplacement(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => Main_Page(),
      //                       ),
      //                     );
      //                   },
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/home.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text(
      //                           "หน้าหลัก",
      //                           style: TextStyle(
      //                               color: Colors.white, fontFamily: 'Kanit'),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => AboutUs()));
      //                   },
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/about.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text(
      //                           "เกี่ยวกับเรา",
      //                           style: TextStyle(
      //                               color: Colors.white, fontFamily: 'Kanit'),
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 30,
      //                 ),
      //                 Text("ภายในร้าน",
      //                     style: TextStyle(
      //                         color: Color.fromARGB(255, 165, 162, 162),
      //                         fontFamily: 'Kanit')),
      //                 SizedBox(
      //                   height: 30,
      //                 ),
      //                 Row(
      //                   children: [
      //                     SvgPicture.asset(
      //                       'assets/images/new/tab4.svg',
      //                       color: Colors.white,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      //                       child: Text("สัตว์",
      //                           style: TextStyle(
      //                               color: Colors.white, fontFamily: 'Kanit')),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Row(
      //                   children: [
      //                     SvgPicture.asset(
      //                       'assets/images/new/tab5.svg',
      //                       color: Colors.white,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                       child: Text("สินค้า",
      //                           style: TextStyle(
      //                               color: Colors.white, fontFamily: 'Kanit')),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     print("object");
      //                   },
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/tab2.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text("ร้านค้า",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontFamily: 'Kanit')),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Row(
      //                   children: [
      //                     SvgPicture.asset(
      //                       'assets/images/new/tab6.svg',
      //                       color: Colors.white,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                       child: Text("น้ำเชื้อ",
      //                           style: TextStyle(
      //                               color: Colors.white, fontFamily: 'Kanit')),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 30,
      //                 ),
      //                 Text("การช่วยเหลือ",
      //                     style: TextStyle(
      //                         color: Color.fromARGB(255, 165, 162, 162),
      //                         fontFamily: 'Kanit')),
      //                 SizedBox(
      //                   height: 30,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => HelpCenterPage()));
      //                   },
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/help2.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text("ศูนย์ช่วยเหลือ",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontFamily: 'Kanit')),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => CareerPage()));
      //                   },
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/us.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text("ร่วมงานกับเรา",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontFamily: 'Kanit')),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 100,
      //                 ),
      //                 Divider(color: Color.fromARGB(255, 165, 162, 162)),
      //                 SizedBox(
      //                   height: 30,
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         'assets/images/new/logout.svg',
      //                         color: Colors.white,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //                         child: Text("ออกจากระบบ",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontFamily: 'Kanit')),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     )),
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
                      Text("ค้นหาแบบละเอียด",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Card1(),
                      Card2(),
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
                                      onPressed: () {},
                                      child: Text(
                                        "รีเซ็ต",
                                        style:
                                            TextStyle(color: Palette.kToDark),
                                      ))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("ตกลง",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                              )
                            ]),
                          ))
                    ],
                  )),
            ),
          )),
    );
  }
}

class Card1 extends StatelessWidget {
  bool press = true;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Column(
      children: <Widget>[
        ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapBodyToCollapse: false,
            ),
            header: Text(
              "โคและกระบือ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 131, 131, 131)),
            ),
            collapsed: Container(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("โคเนื้อ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
                SizedBox(
                  height: 5,
                ),
                Text("โคนม",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
                SizedBox(
                  height: 5,
                ),
                Text("กระบือ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
              ],
            ),
            builder: (_, collapsed, expanded) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Column(
      children: <Widget>[
        ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapBodyToCollapse: false,
            ),
            header: Text(
              "สัตว์ปีก",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 131, 131, 131)),
            ),
            collapsed: Container(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("ร้านค้าทั่วไป",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
                SizedBox(
                  height: 5,
                ),
                Text("ร้านค้าส่งสัตว์",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
                SizedBox(
                  height: 5,
                ),
                Text("บริการขนส่งน้ำเชื้อ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 131, 131, 131))),
              ],
            ),
            builder: (_, collapsed, expanded) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
