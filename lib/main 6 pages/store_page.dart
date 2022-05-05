import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import 'package:zeleex_application/profile.dart';
import 'package:expandable/expandable.dart';
import '../API/Read All/stores_API.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../store_page_detail.dart';

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final controller = ScrollController();
  var perPage = 10; //*ค่าเริ่มต้น แสดง 2 items
  bool hasMore = true;
  void initState() {
    fetch_StorePage_readAll();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          hasMore = false;
          perPage = perPage + 2; //*เลื่อนลง + เพิ่มที่ละ 2 items
        });
      }
    });
    super.initState();
  }

  Future<List<Data_Store_ReadALL>> fetch_StorePage_readAll() async {
    final response = await http.get(Uri.parse(
        'https://sanboxapi.zeleex.com/api/stores?per_page=' +
            perPage.toString()));
    var jsonResponse = json.decode(response.body);

    List jsonCon = jsonResponse['data']['data'];

    if (response.statusCode == 200) {
      if (jsonCon.length < 1) {
        setState(() {
          hasMore = false;
        });
      }
      return jsonCon.map((data) => Data_Store_ReadALL.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
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

            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       SvgPicture.asset(
            //         'assets/images/sort.svg',
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       // SvgPicture.asset(
            //       //   'assets/images/cart123.svg',
            //       //   color: Color.fromARGB(255, 51, 51, 51),
            //       // )
            //     ],
            //   ),
            // )
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
          FutureBuilder<List<Data_Store_ReadALL>>(
            future: fetch_StorePage_readAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Store_ReadALL>? data = snapshot.data;
                return Expanded(
                  child: RawScrollbar(
                    controller: controller,
                    thumbColor: Palette.kToDark,
                    radius: Radius.circular(50),
                    thickness: 5,
                    child: GridView.builder(
                      controller: controller,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: MediaQuery.of(context).size.width /
                        //     (MediaQuery.of(context).size.height / 1.55),

                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.355,
                      ),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < snapshot.data!.length) {
                          return Wrap(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Store_Detail(
                                                storeID:
                                                    data![index].id.toString(),
                                                storeName: data[index]
                                                    .title
                                                    .toString(),
                                              )),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: 
                                                         ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          child: CachedNetworkImage(
                                            imageUrl: data![index]
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
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              218,
                                                              41,
                                                              41))),
                                                  alignment: Alignment.center,
                                                  child: Text("ไม่พบรูปภาพ")),
                                            ),
                                          ),
                                          // Image.network(
                                          //   data![index]
                                          //       .image!
                                          //       .thumbnail
                                          //       .toString(),
                                          //   fit: BoxFit.fill,
                                          // )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 0),
                                        child: Text(
                                          data[index].title.toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 10, 0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: SvgPicture.asset(
                                                  'assets/images/pinstore.svg'),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 100,
                                              child: Text(
                                                data[index].address.toString(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Palette.kToDark),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/star.svg'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("5.0")
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          ),
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
                      Text("ค้นหาแบบละเอียด",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Card1(),
                    ],
                  )),
            ),
          )),
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
      //                             Text("Name Surname",
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
    );
  }
}

class Card1 extends StatelessWidget {
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
              "ประเภทร้านค้า",
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
                // for (var _ in Iterable.generate(5))
                //   Padding(
                //       padding: EdgeInsets.only(bottom: 10),
                //       child: Text(
                //         "loremIpsum",
                //         softWrap: true,
                //         overflow: TextOverflow.fade,
                //       )),
              ],
            ),
            builder: (_, collapsed, expanded) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
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

// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }

//     buildCollapsed1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildCollapsed2() {
//       return buildImg(Colors.lightGreenAccent, 150);
//     }

//     buildCollapsed3() {
//       return Container();
//     }

//     buildExpanded1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                   ),
//                   Text(
//                     "3 Expandable widgets",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildExpanded2() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//               Expanded(child: buildImg(Colors.orange, 100)),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightBlue, 100)),
//               Expanded(child: buildImg(Colors.cyan, 100)),
//             ],
//           ),
//         ],
//       );
//     }

//     buildExpanded3() {
//       return Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "loremIpsum",
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expandable(
//                 collapsed: buildCollapsed1(),
//                 expanded: buildExpanded1(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed2(),
//                 expanded: buildExpanded2(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed3(),
//                 expanded: buildExpanded3(),
//               ),
//               Divider(
//                 height: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Builder(
//                     builder: (context) {
//                       var controller =
//                           ExpandableController.of(context, required: true)!;
//                       return TextButton(
//                         child: Text(
//                           controller.expanded ? "COLLAPSE" : "EXPAND",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button!
//                               .copyWith(color: Colors.deepPurple),
//                         ),
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: false,
                hasIcon: false,
              ),
              header: Container(
                color: Colors.indigoAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ExpandableIcon(
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.arrow_right,
                          collapseIcon: Icons.arrow_drop_down,
                          iconColor: Colors.white,
                          iconSize: 28.0,
                          iconRotationAngle: 3.414 / 2,
                          iconPadding: EdgeInsets.only(right: 5),
                          hasIcon: false,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Items",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: buildList(),
            ),
          ],
        ),
      ),
    ));
  }
}
