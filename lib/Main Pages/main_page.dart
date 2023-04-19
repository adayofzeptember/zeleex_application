import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zeleex_application/API/Read%20All/collection_board.dart';
import 'package:zeleex_application/API/Read%20All/home_getData_api.dart';
import 'package:zeleex_application/API/Read%20All/products_API.dart';
import 'package:zeleex_application/API/Read%20All/slider_api.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/cart.dart';
import 'package:zeleex_application/Main%20Pages/products.dart';
import 'package:zeleex_application/Main%20Pages/search_results_page.dart';
import 'package:zeleex_application/store_page_detail_cattleDetail.dart';
import 'package:zeleex_application/store_page_detail_productDetail.dart';
import '../API/Read All/advance_search.dart';

import '../Others/Plate.dart';
import '../Screens/Main Sixx Pages/animals_page.dart';
import '../login.dart';

var searchController = TextEditingController();

class Main_Widget extends StatefulWidget {
  Main_Widget({Key? key}) : super(key: key);
  @override
  State<Main_Widget> createState() => _Main_WidgetState();
}

class _Main_WidgetState extends State<Main_Widget> {
  @override
  late Future<List<Data_Collection_Board>> future_board;
  late Future<List<DataSlider>> futureData;
  late Future<List<AnimalCat01>> future_anmials_cat;
  late Future<List<ProductCat01>> future_products_cat;
  late Future<List<Data_Products_ReadAll>> future_products_All;
  String userID = "";
  String userToken = "";
  int activeIndex = 0;
  int countIMG = 0;

  List<String> suggestions = [];

  Future<List<Data_Search>> fetch_search() async {
    final response = await http
        .get(Uri.parse('https://admin.zeleex.com/api/search?keyword=en'));

    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data'];
    var ee = jsonResponse['data'][0].toString();

    print(suggestions);
    for (var i = 0; i < jsonCon.length; i++) {
      var ee = jsonResponse['data'][i]['title'].toString();
      suggestions.add(ee);
    }
    print(suggestions);
    // print(jsonCon.length);
    if (response.statusCode == 200) {
      // print(jsonResponse.toString());
      // print(ee.toString());
      return jsonCon.map((data) => Data_Search.fromJson(data)).toList();
    } else {
      throw Exception("error");
    }
  }

  Future<List<DataSlider>> fetch_SliderPics() async {
    final response =
        await http.get(Uri.parse('https://api.zeleex.com/api/sliders'));

    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data'];
    setState(() {
      countIMG = jsonCon.length;
    });
    if (response.statusCode == 200) {
      return jsonCon.map((data) => new DataSlider.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
  }

  Future get_storedToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');

    setState(() {
      userID = y.toString();
      userToken = x.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    get_storedToken();
    fetch_search();
    futureData = fetch_SliderPics();
    future_board = fetch_collection_board();
    future_anmials_cat = fetch_Home_animals();
    future_products_cat = fetch_Home_products();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: ZeleexColor.zeleexGreen,
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Visibility(
                  visible: false,
                  child: SizedBox(
                      child: SvgPicture.asset(
                    'assets/images/menu.svg',
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
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
                  'หน้าหลัก',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartPage(
                                  user_id: userID.toString(),
                                  user_token: userToken.toString(),
                                )));
                  },
                  child: SvgPicture.asset(
                    'assets/images/cart123.svg',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.20),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: SearchField(
                              controller: searchController,
                              onSuggestionTap: (p0) {
                                print(p0.toString());
                              },
                              onSubmit: ((p0) => {
                                    print(p0.toString()),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Search_Results_Page(
                                                  keyWord: p0.toString(),
                                                )))
                                  }),
                              textInputAction: TextInputAction.done,
                              hasOverlay: false,
                              searchInputDecoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'ค้นหา...',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 161, 161, 161),
                                  size: 25,
                                ),
                                //hintStyle: TextStyle(color: ZeleexColor.zeleexGreen),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 230, 228, 228),
                                      width: 0),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0),
                                ),
                              ),
                              suggestionsDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              suggestions: suggestions
                                  .map((e) => SearchFieldListItem(e))
                                  .toList()),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //       height: MediaQuery.of(context).size.height * 0.057,
                      //       width: double.infinity,
                      //       child: TextField(
                      //         onSubmitted: (value) {
                      //           if (value.isEmpty) {
                      //             print("input something.");
                      //           } else {
                      //             print(value);
                      //           }
                      //         },
                      //         textInputAction: TextInputAction.search      ,
                      //         decoration: InputDecoration(
                      //           filled: true,
                      //           fillColor: Colors.white,
                      //           hintText: 'ค้นหา...',
                      //           prefixIcon: Icon(
                      //             Icons.search,
                      //             color: Color.fromARGB(255, 161, 161, 161),
                      //             size: 25,
                      //           ),
                      //              hintStyle: TextStyle(color: ZeleexColor.zeleexGreen),
                      //           enabledBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(60.0)),
                      //             borderSide: BorderSide(
                      //                 color: Color.fromARGB(255, 230, 228, 228),
                      //                 width: 0),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(60.0)),
                      //             borderSide:
                      //                 BorderSide(color: Colors.white, width: 0),
                      //           ),
                      //         ),
                      //       )
                      //       ),

                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder<List<DataSlider>>(
                          future: futureData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<DataSlider>? data = snapshot.data;
                              return CarouselSlider.builder(
                                  itemCount: data?.length,
                                  itemBuilder:
                                      (BuildContext, index, realIndex) {
                                    return InkWell(
                                      onTap: (() {
                                        launchUrlString(
                                            data![index].link.toString());
                                      }),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  167, 216, 216, 216)),
                                          child: SvgPicture.network(
                                            data![index].image!.toString(),
                                          )),
                                    );
                                  },
                                  options: CarouselOptions(
                                      aspectRatio: 16 / 9,
                                      enlargeCenterPage: true,
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 5),
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 2),
                                      onPageChanged: (index, reason) =>
                                          setState(
                                            (() => activeIndex = index),
                                          )));
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                      buildIndcator(),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: Row(
                            children: [
                              FutureBuilder<List<Data_Collection_Board>>(
                                future: future_board,
  
                                
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Data_Collection_Board>? data =
                                        snapshot.data;
                                    return Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          // shrinkWrap: true,
                                          itemCount: data?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 100,
                                              width: 80,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 75,
                                                    width: 70,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: CachedNetworkImage(
                                                        imageUrl: data![index]
                                                            .image!
                                                            .main
                                                            .toString(),
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          height: 85,
                                                          width: 85,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        placeholder:
                                                            (context, url) =>
                                                                CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            CircleAvatar(
                                                          child: Icon(
                                                            Icons.person,
                                                            color:
                                                                ZeleexColor.zeleexGreen,
                                                          ),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  224,
                                                                  224,
                                                                  224),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    data[index]
                                                        .title
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          color:
                                              Color.fromARGB(255, 51, 50, 51),
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: ZeleexColor.zeleexGreen,
                                          elevation: 0),
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
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.260,
                                child: Row(
                                  children: [
                                    FutureBuilder<List<AnimalCat01>>(
                                      future: future_anmials_cat,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          var oneK = NumberFormat("#,###");
                                          List<AnimalCat01>? data =
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
                                                                        Store_Cattle_Detail(
                                                                          animalID: data![index]
                                                                              .id
                                                                              .toString(),
                                                                          animalName: data[index]
                                                                              .title
                                                                              .toString(),
                                                                        )));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5)),
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: data![
                                                                        index]
                                                                    .image!
                                                                    .thumbnail
                                                                    .toString(),
                                                                fit:
                                                                    BoxFit.fill,
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
                                                                    (context,
                                                                            url,
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
                                                                    (context,
                                                                            url,
                                                                            error) =>
                                                                        Center(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0),
                                                                    child: Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.22,
                                                                        decoration: BoxDecoration(
                                                                            border: Border.all(
                                                                                color: Color.fromARGB(255, 211, 204,
                                                                                    204)),
                                                                            borderRadius: BorderRadius.all(Radius.circular(
                                                                                5))),
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Icon(
                                                                            Icons.error_outline)),
                                                                  ),
                                                                ),
                                                              ),
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
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  "฿ " +
                                                                      NumberFormat("#,###").format(int.parse(data[
                                                                              index]
                                                                          .price
                                                                          .toString())),
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
                                            "สินค้าอื่น ๆ",
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
                                                primary: ZeleexColor.zeleexGreen,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.250,
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
                                                                      builder: (context) =>
                                                                          Store_Product_Detail(
                                                                            productName:
                                                                                data![index].title.toString(),
                                                                            productID:
                                                                                data[index].id.toString(),
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
                                                                    imageUrl: data![
                                                                            index]
                                                                        .image!
                                                                        .thumbnail
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.3,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.3,
                                                                    progressIndicatorBuilder: (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Container(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          192,
                                                                          192,
                                                                          192),
                                                                      height:
                                                                          200,
                                                                    ),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        Icon(Icons
                                                                            .error),
                                                                  ),
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
                                                                          style:
                                                                              TextStyle(fontSize: 13),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        "฿ " +
                                                                            NumberFormat("##,###,###").format(int.parse(data[index].price.toString())),
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
                                                return Text(
                                                    "${snapshot.error}");
                                              }

                                              return Container();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
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
      ),
    );
  }

  Widget buildIndcator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: countIMG,
        effect: ScrollingDotsEffect(
            dotWidth: 5,
            dotHeight: 5,
            dotColor: Colors.grey,
            activeDotColor: ZeleexColor.zeleexGreen),
      );
}
