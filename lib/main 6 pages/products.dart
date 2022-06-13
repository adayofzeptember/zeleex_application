import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20All/products_API.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/store_page_detail_productDetail.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../from Profile/profile.dart';
import 'main_page.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller = ScrollController();
  var perPage = 8; //*ค่าเริ่มต้น แสดง 2 items
  bool hasMore = true;
  void initState() {
    fetch_ProductPage_readAll();
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

  Future<List<Data_Products_ReadAll>> fetch_ProductPage_readAll() async {
    final response = await http.get(Uri.parse(
        'https://sanboxapi.zeleex.com/api/products?per_page=' +
            perPage.toString()));
    var jsonResponse = json.decode(response.body);

    List jsonCon = jsonResponse['data']['data'];

    if (response.statusCode == 200) {
      if (jsonCon.length < perPage) {
        setState(() {
          hasMore = false;
        });
      }
      return jsonCon
          .map((data) => Data_Products_ReadAll.fromJson(data))
          .toList();
    } else {
      throw Exception("error...");
    }
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
              icon: Visibility(
                visible: false,
                child: SizedBox(
                    child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: Color.fromARGB(255, 51, 51, 51),
                )),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "สินค้า",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/sort.svg',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/images/cart123.svg',
                    )
                  ],
                ),
              )
            ],
          )),
      body: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   color: Colors.white,
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               print("object");
          //               //MediaQuery.of(context).size.height * 0.25
          //             },
          //             child: Container(
          //               width: MediaQuery.of(context).size.width * 0.35,
          //               padding: EdgeInsets.all(10.0),
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.grey),
          //                 borderRadius: BorderRadius.circular(30.0),
          //               ),
          //               child: Text(
          //                 "อุปกรณ์",
          //                 style: TextStyle(
          //                     color: Colors.grey,
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.bold),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width * 0.35,
          //             padding: EdgeInsets.all(10.0),
          //             decoration: BoxDecoration(
          //               color: Palette.kToDark,
          //               borderRadius: BorderRadius.circular(30.0),
          //             ),
          //             child: Text(
          //               "อาหารและยา",
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 12),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width * 0.35,
          //             padding: EdgeInsets.all(10.0),
          //             decoration: BoxDecoration(
          //               border: Border.all(color: Colors.grey),
          //               borderRadius: BorderRadius.circular(30.0),
          //             ),
          //             child: Text(
          //               "น้ำเชื้อและตัวอ่อน",
          //               style: TextStyle(
          //                   fontSize: 12,
          //                   color: Color.fromARGB(255, 130, 130, 130),
          //                   fontWeight: FontWeight.bold),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          FutureBuilder<List<Data_Products_ReadAll>>(
            future: fetch_ProductPage_readAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Products_ReadAll>? data = snapshot.data;
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
                            MediaQuery.of(context).size.height * 0.322,
                      ),
                      itemCount: snapshot.data!.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data!.length) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Store_Product_Detail(
                                          productName:
                                              data[index].title.toString(),
                                          productID: data[index].id.toString(),
                                        )));
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
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Container(
                                        color:
                                            Color.fromARGB(255, 142, 142, 142),
                                        // height: 200,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 0),
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 211, 204, 204),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              alignment: Alignment.center,
                                              child: Text("ไม่พบรูปภาพ")),
                                        ),
                                      ),
                                    ),
                                    // Image.network(
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                    child: Container(
                                      height: 40,
                                      child: Text(
                                        data[index].title.toString(),
                                        style: TextStyle(
                                          fontSize: 13,
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
                                        "฿ " + data[index].price.toString(),
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
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
                //return Text("${"snapshot.error"}");
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(child: Text("Cumming Soon!")),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          ),
        ],
      ),
    );
  }
}
