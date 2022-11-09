import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/products_API.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/Read%20By%20ID/product_review.dart';
import 'package:zeleex_application/main%206%20pages/store_filtered.dart';
import 'package:zeleex_application/store_page_detail_productDetail.dart';
import '../API/Read All/filters/product_types.dart';

import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../from Profile/profile.dart';
import 'onlyMenuForMainPage_nothing_here.dart';
import 'product_filtered.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}
late Future<List<Data_Product_Types>> future_product_types;
late Future<List<Data_Products_ReadAll>> future_AllProducts;
//late Future<List<Cart_ReadList>> future_fetchAmountinCart;
String cartAdd_userID = "";
String cartAdd_token = "";

class _ProductPageState extends State<ProductPage> {
  final controller = ScrollController();
  int x = 0;
  int k = 0;
  var perPage = 8; //*ค่าเริ่มต้น แสดง 2 items
  bool hasMore = true;
  void initState() {
    future_product_types = fetch_product_cat();
    getUserID();
    // future_fetchAmountinCart =
    //     fetch_user_cart_list(cartAdd_userID, cartAdd_token);

    future_AllProducts = fetch_ProductPage_readAll();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          hasMore = false;
          perPage = perPage + 2; //*เลื่อนลง + เพิ่มที่ละ 2 items
        });
      }
    });
    //future_fetchAmountinCart;
    super.initState();
  }

  // Future<List<Cart_ReadList>> fetch_user_cart_list(
  //     String userID, String userToken) async {
  //   final response = await http.get(
  //       Uri.parse('https://api.zeleex.com/api/cart/list?user_id=' +
  //           userID.toString()),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $userToken',
  //       });

  //   var jsonResponse = json.decode(response.body);
  //   var jsonCon = jsonResponse['data']['product_all'];

  //   if (response.statusCode == 200) {
  //     print(jsonCon);
  //     setState(() {
  //       x = int.parse(jsonCon.toString());
  //     });
  //     return jsonCon.map((data) => new Cart_ReadList.fromJson(data)).toList();
  //   } else {
  //     throw Exception("error...");
  //   }
  // }

  Future getUserID() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    String y = prefs2.get('keyID').toString();
    String x = prefs2.get('keyToken').toString();
    setState(() {
      cartAdd_userID = y;
      cartAdd_token = x;
    });
  }

  Future<List<Data_Products_ReadAll>> fetch_ProductPage_readAll() async {
    final response = await http.get(Uri.parse(
        'https://api.zeleex.com/api/products?per_page=' + perPage.toString()));
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
          elevation: 0,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text('data',
                      style: TextStyle(
                        color: Colors.white,
                      ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "สินค้า",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold),
                ),
              ),
              Container(),
            ],
          )),
      body: Column(
        children: <Widget>[
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
                        // childAspectRatio: MediaQuery.of(context).size.width /
                        //     (MediaQuery.of(context).size.height / 1.55),

                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.28,
                      ),
                      itemCount: snapshot.data!.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data!.length) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InkWell(
                              onTap: () {
                                print(data[index].id.toString());
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Store_Product_Detail(
                                          productName:
                                              data[index].title.toString(),
                                          productID: data[index].id.toString(),
                                          //!qty: x.toString(),
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
      //!
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
                          
                      FutureBuilder<List<Data_Product_Types>>(
                        future: future_product_types,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Data_Product_Types>? data = snapshot.data;

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
                                            print(data[index].id.toString());
                                            // setState(() {
                                            //   typeID =
                                            //       data[index].id.toString();
                                            // });
                                            // print(typeID.toString());
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
                                                  Product_Filtered(
                                                    typeID: 1.toString(),
                                                  )));
                                    },
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
