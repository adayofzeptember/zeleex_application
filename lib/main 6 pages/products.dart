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
import 'onlyMenuForMainPage_nothing_here.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}



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
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/sort.svg',
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                      ),
                      Positioned(
                          top: 5.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              x.toString(),
                              style: TextStyle(
                                fontSize: 0,
                                color: Colors.green,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
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
    );
  }
}