import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zeleex_application/API/Read%20All/home_getData_api.dart';
import 'package:zeleex_application/API/Read%20All/slider_api.dart';

import 'package:zeleex_application/cart.dart';
import 'package:zeleex_application/main%206%20pages/animal.dart';
import 'package:zeleex_application/main%206%20pages/newsfeed.dart';
import 'package:zeleex_application/main%206%20pages/products.dart';
import 'package:zeleex_application/main%206%20pages/semens.dart';
import 'package:zeleex_application/newsfeed_detail.dart';
import 'package:zeleex_application/profile.dart';
import 'package:zeleex_application/store_page_detail_cattleDetail.dart';
import 'package:zeleex_application/store_page_detail_productDetail.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../login.dart';

class Main_Widget extends StatefulWidget {
  Main_Widget({Key? key}) : super(key: key);

  @override
  State<Main_Widget> createState() => _Main_WidgetState();
}

class _Main_WidgetState extends State<Main_Widget> {
  @override
  late Future<List<DataSlider>> futureData;
  late Future<List<AnimalCat01>> future_anmials_cat;
  late Future<List<ProductCat01>> future_products_cat;

  @override
  void initState() {
    super.initState();
    futureData = fetch_SliderPics();
    future_anmials_cat = fetch_Home_animals();
    future_products_cat = fetch_Home_products();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
          //systemOverlayStyle: SystemUiOverlayStyle.dark, // 1

          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark,
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                  child: SvgPicture.asset(
                'assets/images/menu.svg',
                color: Color.fromARGB(255, 255, 255, 255),
              )),
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
              Text(
                "หน้าหลัก",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: SvgPicture.asset(
                  'assets/images/cart123.svg',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.27),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/images/search.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "search for cattles...",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 130, 130, 130),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Text(
                                  "ค้นหา",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsFeedPage()));
                        },
                        child: FutureBuilder<List<DataSlider>>(
                          future: futureData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<DataSlider>? data = snapshot.data;
                              return ImageSlideshow(
                                initialPage: 0,
   //uuhjghgvllk 

  

                                indicatorColor: Palette.kToDark,
                                indicatorBackgroundColor: Colors.grey,
                                autoPlayInterval: 3000,
                                isLoop: true,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data?.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Image.network(
                                          
                                          data![index].image.toString(),
                                        );
                                      })
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // By default show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnimalsPage(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      child: SvgPicture.asset(
                                        'assets/images/cow.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "โคเนื้อ",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/cowmilk.svg',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("โคนม", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    child: SvgPicture.asset(
                                      'assets/images/buff.svg',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("กระบือ", style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SemensPage()));
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      child: SvgPicture.asset(
                                        'assets/images/cum2.svg',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("น้ำเชื้อ",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductPage()));
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      child: SvgPicture.asset(
                                        'assets/images/thing.svg',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("อุปกรณ์",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductPage()));
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      child: SvgPicture.asset(
                                        'assets/images/food.svg',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("อาหารและยา",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // CachedNetworkImage(
                    //   imageUrl: "http://via.placeholder.com/350x150",

                    //   progressIndicatorBuilder:
                    //       (context, url, downloadProgress) =>
                    //         Container(color: Color.fromARGB(255, 110, 109, 109), height: 200,),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    10,
                                    10,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    "โคและกระบือ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 50, 51),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.kToDark, elevation: 0),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AnimalsPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "ดูทั้งหมด",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // in cloumn
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.240,
                              child: Row(
                                children: [
                                  FutureBuilder<List<AnimalCat01>>(
                                    future: future_anmials_cat,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        var oneK = NumberFormat("#,###");
                                        List<AnimalCat01>? data = snapshot.data;
                                        return Expanded(
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              // shrinkWrap: true,
                                              itemCount: data?.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Store_Cattle_Detail()));
                                                      print(
                                                        data![index]
                                                            .id
                                                            .toString(),
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5)),
                                                          child:
                                                              //     Image.network(
                                                              //   data![index]
                                                              //       .image!
                                                              //       .thumbnail
                                                              //       .toString(),
                                                              //   fit: BoxFit.fill,
                                                              //   height: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.3,
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.3,
                                                              // )

                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                data![index]
                                                                    .image!
                                                                    .thumbnail
                                                                    .toString(),
                                                            fit: BoxFit.fill,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Container(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      142,
                                                                      142,
                                                                      142),
                                                              height: 200,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 40,
                                                                width: 100,
                                                                child: Text(
                                                                  data[index]
                                                                      .title
                                                                      .toString(),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                "฿ " +
                                                                    NumberFormat(
                                                                            "#,###")
                                                                        .format(int.parse(data[index]
                                                                            .price
                                                                            .toString())),
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            17,
                                                                            0)),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      // By default show a loading spinner.
                                      // return Container(
                                      //   width: double.infinity,
                                      //   height: 200,
                                      //   color: Colors.amber,
                                      // );
                                      return Container();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          10,
                                          10,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          "สินค้า",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Palette.kToDark,
                                              elevation: 0),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPage(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "ดูทั้งหมด",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.240,
                                    child: Row(
                                      children: [
                                        FutureBuilder<List<ProductCat01>>(
                                          future: future_products_cat,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<ProductCat01>? data =
                                                  snapshot.data;
                                              return Expanded(
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    // shrinkWrap: true,
                                                    itemCount: data?.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Card(
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Store_Product_Detail(
                                                                              productName: data![index].title.toString(),
                                                                              productID: data[index].id.toString(),
                                                                            )));
                                                          },
                                                          child: Column(
                                                            children: [
                                                              ClipRRect(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              5),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5)),
                                                                  child:
                                                                          CachedNetworkImage(
                                                            imageUrl:
                                                                data![index]
                                                                    .image!
                                                                    .thumbnail
                                                                    .toString(),
                                                            fit: BoxFit.fill,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Container(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      192,
                                                                      192,
                                                                      192),
                                                              height: 200,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                                  //  Image
                                                                  //     .network(
                                                                  //   data![index]
                                                                  //       .image!
                                                                  //       .thumbnail
                                                                  //       .toString(),
                                                                  //   fit: BoxFit
                                                                  //       .fill,
                                                                  //   // height: MediaQuery.of(context)
                                                                  //   //         .size
                                                                  //   //         .height *
                                                                  //   //     0.05,
                                                                  //   width: MediaQuery.of(context)
                                                                  //           .size
                                                                  //           .width *
                                                                  //       0.3,
                                                                  // )
                                                                  
                                                                  ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40,
                                                                      width:
                                                                          100,
                                                                      child:
                                                                          Text(
                                                                        data[index]
                                                                            .title
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Text(
                                                                      "฿ " +
                                                                          data[index]
                                                                              .price
                                                                              .toString(),
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              17,
                                                                              0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              );
                                            } else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            return Container();
                                            // return Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 200),
                                            //   child:
                                            //       CircularProgressIndicator(),
                                            // );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   width: double.infinity,
                                  //   child: SingleChildScrollView(
                                  //     scrollDirection: Axis.horizontal,
                                  //     child: Row(
                                  //       //main axis (rows or columns)

                                  //       // crossAxisAlignment: CrossAxisAlignment.start,
                                  //       children: [
                                  //         Card(
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                       builder: (context) =>
                                  //                           Store_Product_Detail()));
                                  //             },
                                  //             child: Padding(
                                  //               padding:
                                  //                   const EdgeInsets.all(8.0),
                                  //               child: Column(
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   ClipRRect(
                                  //                     borderRadius:
                                  //                         BorderRadius.all(
                                  //                             Radius.circular(
                                  //                                 5)),
                                  //                     child: Image.asset(
                                  //                         'assets/images/pd1.png'),
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 10,
                                  //                   ),
                                  //                   Text(
                                  //                     "Cattles1",
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 3,
                                  //                   ),
                                  //                   Text(
                                  //                     "฿ 170",
                                  //                     style: TextStyle(
                                  //                         color: Color.fromARGB(
                                  //                             255, 255, 17, 0)),
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Card(
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                       builder: (context) =>
                                  //                           Store_Product_Detail()));
                                  //             },
                                  //             child: Padding(
                                  //               padding:
                                  //                   const EdgeInsets.all(8.0),
                                  //               child: Column(
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   ClipRRect(
                                  //                     borderRadius:
                                  //                         BorderRadius.all(
                                  //                             Radius.circular(
                                  //                                 5)),
                                  //                     child: Image.asset(
                                  //                         'assets/images/pd2.png'),
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 10,
                                  //                   ),
                                  //                   Text(
                                  //                     "Cattles2",
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 3,
                                  //                   ),
                                  //                   Text(
                                  //                     "฿ 100",
                                  //                     style: TextStyle(
                                  //                         color: Color.fromARGB(
                                  //                             255, 255, 17, 0)),
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Card(
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                       builder: (context) =>
                                  //                           Store_Product_Detail()));
                                  //             },
                                  //             child: Padding(
                                  //               padding:
                                  //                   const EdgeInsets.all(8.0),
                                  //               child: Column(
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   ClipRRect(
                                  //                     borderRadius:
                                  //                         BorderRadius.all(
                                  //                             Radius.circular(
                                  //                                 5)),
                                  //                     child: Image.asset(
                                  //                       'assets/images/pd3.png',
                                  //                     ),
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 10,
                                  //                   ),
                                  //                   Text(
                                  //                     "Cattles3",
                                  //                   ),
                                  //                   SizedBox(
                                  //                     height: 3,
                                  //                   ),
                                  //                   Text(
                                  //                     "฿ 90",
                                  //                     style: TextStyle(
                                  //                         color: Color.fromARGB(
                                  //                             255, 255, 17, 0)),
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(232, 36, 28, 28), //desired color
          ),
          child: Container(
            width: 250,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  0,
                  0,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Palette.kToDark,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name Surname",
                                      style: TextStyle(
                                          color: Palette.kToDark,
                                          fontFamily: 'Kanit')),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "ดูโปรไฟล์",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 165, 162, 162),
                                        fontFamily: 'Kanit'),
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
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/home.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "หน้าหลัก",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Kanit'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/about.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "เกี่ยวกับเรา",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("ภายในร้าน",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 162, 162),
                              fontFamily: 'Kanit')),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab4.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("สัตว์",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab5.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text("สินค้า",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/tab2.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ร้านค้า",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/new/tab6.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text("น้ำเชื้อ",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Kanit')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("การช่วยเหลือ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 162, 162),
                              fontFamily: 'Kanit')),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenterPage()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/help2.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ศูนย์ช่วยเหลือ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CareerPage()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/us.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ร่วมงานกับเรา",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Divider(color: Color.fromARGB(255, 165, 162, 162)),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/logout.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("ออกจากระบบ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
