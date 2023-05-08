// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeleex_application/API/Read%20All/products_API.dart';
// import 'package:http/http.dart' as http;
// import 'package:zeleex_application/API/Read%20By%20ID/product_review.dart';
// import 'package:zeleex_application/Main%20Pages/store_filtered.dart';
// import 'package:zeleex_application/store_page_detail_productDetail.dart';
// import '../API/Read All/filters/product_types.dart';

// import '../Others/Plate.dart';
// import '../help.dart';
// import '../from Profile/profile.dart';
// import 'onlyMenuForMainPage_nothing_here.dart';
// import 'product_filtered.dart';

// class ProductPage extends StatefulWidget {
//   ProductPage({Key? key}) : super(key: key);
//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// late Future<List<Data_Product_Types>> future_product_types;
// late Future<List<Data_Products_ReadAll>> future_AllProducts;
// //late Future<List<Cart_ReadList>> future_fetchAmountinCart;
// String cartAdd_userID = "";
// String cartAdd_token = "";

// class _ProductPageState extends State<ProductPage> {
//   final controller = ScrollController();

//   bool press = false;
//   String test = 'https://admin.zeleex.com/api/products?per_page=15&page=';
//   String typeID = "";
//   List data = [];
//   final scrollController = ScrollController();
//   int page = 1;
//   bool isLoadingMore = false;

//   bool hasMore = true;
//   void initState() {
//     future_product_types = fetch_product_cat();

//     fetch_ProductPage_readAll();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 242, 242, 242),
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           systemOverlayStyle: SystemUiOverlayStyle(
//               statusBarColor: Colors.white,
//               statusBarIconBrightness: Brightness.dark,
//               statusBarBrightness: Brightness.dark),
//           elevation: 0,
//           actions: [
//             Builder(
//               builder: (context) => IconButton(
//                 icon: SizedBox(
//                   child: SvgPicture.asset(
//                     'assets/images/sort.svg',
//                   ),
//                 ),
//                 onPressed: () => Scaffold.of(context).openEndDrawer(),
//               ),
//             ),
//           ],
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                   child: Text('data',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ))),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Text(
//                   "สินค้า",
//                   style: TextStyle(
//                       color: ZeleexColor.zeleexGreen, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(),
//             ],
//           )),
//       body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: MediaQuery.of(context).size.width /
//                 (MediaQuery.of(context).size.height / 1.8),
//           ),
//           controller: scrollController,
//           itemCount: isLoadingMore ? data.length + 1 : data.length,
//           itemBuilder: (context, index) {
//             if (index < data.length) {
//               final post = data[index];

//               final title = post['title'];
//               return 
              
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0)),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => Store_Product_Detail(
//                               productName: post['title'].toString(),
//                               productID: post['id'].toString(),
//                               //!qty: x.toString(),
//                             )));
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(5),
//                             topRight: Radius.circular(5)),
//                         child: CachedNetworkImage(
//                           imageUrl: post['image']['thumbnail'].toString(),
//                           fit: BoxFit.fill,
//                           progressIndicatorBuilder:
//                               (context, url, downloadProgress) => Container(
//                             color: Color.fromARGB(255, 142, 142, 142),
//                             // height: 200,
//                           ),
//                           errorWidget: (context, url, error) => Center(
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
//                               child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.22,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color:
//                                             Color.fromARGB(255, 211, 204, 204),
//                                       ),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5))),
//                                   alignment: Alignment.center,
//                                   child: Text("ไม่พบรูปภาพ")),
//                             ),
//                           ),
//                         ),
//                         // Image.network(
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
//                         child: Container(
//                           height: 40,
//                           child: Text(
//                             post['title'].toString(),
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color.fromARGB(255, 51, 51, 51),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//                           child: Text(
//                             "฿ " +
//                                 NumberFormat("#,###,###").format(int.parse(
//                                     post['skus_min_price'].toString())),
//                             style: TextStyle(color: Colors.red),
//                           )),
//                       SizedBox(
//                         height: 8,
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//       //!
//       endDrawer: 
//       Theme(
//           data: Theme.of(context).copyWith(
//             canvasColor: Colors.white, //desired color
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.height * 0.3,
//             child: Drawer(
//               child: Padding(
//                   padding: const EdgeInsets.fromLTRB(
//                     20,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.07,
//                       ),
//                       Text("ค้นหาจากหมวดหมู่",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       FutureBuilder<List<Data_Product_Types>>(
//                         future: future_product_types,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             List<Data_Product_Types>? data = snapshot.data;

//                             return ListView.builder(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: data!.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Container(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         InkWell(
//                                           onTap: () {
//                                             print(data[index].id.toString());
//                                             // setState(() {
//                                             //   typeID =
//                                             //       data[index].id.toString();
//                                             // });
//                                             // print(typeID.toString());
//                                           },
//                                           child: Text(
//                                               data[index].title.toString(),
//                                               style: TextStyle(
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color.fromARGB(
//                                                       255, 131, 131, 131))),
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         )
//                                       ],
//                                     ),
//                                   );
//                                 });
//                           } else if (snapshot.hasError) {
//                             return Text("${snapshot.error}");
//                           }
//                           return Container();
//                         },
//                       ),
//                       Spacer(),
//                       Container(
//                           //height: double.infinity,
//                           alignment: Alignment.bottomCenter,
//                           width: double.infinity,
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 20, bottom: 20),
//                             child: Row(children: <Widget>[
//                               Expanded(
//                                   child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         elevation: 0,
//                                         primary: Colors.white,
//                                         side:
//                                             BorderSide(color: ZeleexColor.zeleexGreen),
//                                       ),
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                         initState();
//                                       },
//                                       child: Text(
//                                         "ยกเลิก",
//                                         style:
//                                             TextStyle(color: ZeleexColor.zeleexGreen),
//                                       ))),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   Product_Filtered(
//                                                     typeID: 1.toString(),
//                                                   )));
//                                     },
//                                     child: Text("ตกลง",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ))),
//                               )
//                             ]),
//                           ))
//                     ],
//                   )),
//             ),
//           )),
//     );
//   }

//   Future<void> fetch_ProductPage_readAll() async {
//     final response = await http.get(
//       Uri.parse(test + page.toString()),
//       // Uri.parse('https://admin.zeleex.com/api/stores?per_page=15&page=${page}'),
//       headers: {'Accept': 'application/json'},
//     );
//     var jsonResponse = json.decode(response.body);
//     final jsonCon = jsonResponse['data']['data'] as List;
//     if (response.statusCode == 200) {
//       setState(() {
//         data = data + jsonCon;
//       });
//     } else {
//       throw Exception("error...");
//     }
//   }

//   Future<void> _scrollListener() async {
//     if (isLoadingMore) return;
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       setState(() {
//         isLoadingMore = true;
//       });
//       page = page + 1;

//       await fetch_ProductPage_readAll();
//       setState(() {
//         isLoadingMore = false;
//       });
//     }
//   }
// }
