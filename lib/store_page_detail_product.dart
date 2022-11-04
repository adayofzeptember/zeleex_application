import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20By%20ID/store_id_api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'API/Read All/products_API.dart';
import 'Plate.dart';
import 'store_page_detail.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/products_API.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20By%20ID/product_review.dart';
import 'package:zeleex_application/store_page_detail_productDetail.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../from Profile/profile.dart';
import 'store_page_detail_productDetail.dart';

class Store_ProductPage extends StatefulWidget {
  String storeID = "";
  Store_ProductPage({Key? key, required this.storeID}) : super(key: key);

  @override
  State<Store_ProductPage> createState() => _Store_ProductPageState();
}

class _Store_ProductPageState extends State<Store_ProductPage> {
  bool pressed = true;
  late Future<List<Data_Products_ReadAll>> future_AllProducts;
  final controller = ScrollController();

  Future<List<Data_Products_ReadAll>> fetch_ProductPage_readAll() async {
    final response =
        await http.get(Uri.parse('https://api.zeleex.com/api/products?store_id='+widget.storeID));
    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data']['data'];
    if (response.statusCode == 200) {
      return jsonCon
          .map((data) => Data_Products_ReadAll.fromJson(data))
          .toList();
    } else {
      throw Exception("error...");
    }
  }

  Future<Data_Store> fetchStore_ByID() async {
    var url = "https://api.zeleex.com/api/stores/" + widget.storeID;
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data'];
    Data_Store msg = Data_Store.fromJson(jsonCon);
    return msg;
  }

  @override
  void initState() {
    future_AllProducts = fetch_ProductPage_readAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
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
                  SvgPicture.asset(
                    'assets/images/cart123.svg',
                  )
                ],
              )
            ],
          )),
      body: Column(
        children: <Widget>[
          FutureBuilder(
              future: fetchStore_ByID(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  Data_Store thisStore_notCoverIMG = snapshot.data;
                  return Container(
                      child: Padding(
                                      padding: const EdgeInsets.fromLTRB(6, 5, 6, 0),

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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 131, 131, 131),
                                      backgroundImage: NetworkImage(
                                          thisStore_notCoverIMG.image!.thumbnail
                                              .toString()),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          thisStore_notCoverIMG.title
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                              thisStore_notCoverIMG.address
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
                                              thisStore_notCoverIMG.phone
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
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/images/star.svg'),
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
                                              BorderRadius.circular(30),
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
                                      pressed ? "ติดตาม" : "ติดตามแล้ว",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //! แก้ไขเพิ่มเติม
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text("ประเภทร้านค้า "),
                                  Container(
                                    height: 20,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            thisStore_notCoverIMG.types!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              Text(
                                                thisStore_notCoverIMG
                                                        .types![index].title
                                                        .toString() +
                                                    ", ",
                                                style: TextStyle(
                                                    color: Palette.kToDark),
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
                            Divider(color: Color.fromARGB(255, 165, 162, 162)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                thisStore_notCoverIMG.content.toString(),
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
              }),
          FutureBuilder<List<Data_Products_ReadAll>>(
            future: future_AllProducts,
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.28,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: InkWell(
                            onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Store_Product_Detail(
                                          productName:
                                              data![index].title.toString(),
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
                                    imageUrl: data![index]
                                        .image!
                                        .thumbnail
                                        .toString(),
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Container(
                                      color: Color.fromARGB(255, 142, 142, 142),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            alignment: Alignment.center,
                                            child: Text("ไม่พบรูปภาพ")),
                                      ),
                                    ),
                                  ),
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
                                        color: Color.fromARGB(255, 51, 51, 51),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
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
                      },
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                 ),
              );
            },
          ),
        ],
      ),
    );
  }
}
