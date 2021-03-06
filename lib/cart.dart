import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/cart_getUserCartList.dart';
import 'package:zeleex_application/main%206%20pages/main_widget.dart';
import 'package:zeleex_application/register.dart';
import 'API/model.dart';
import 'Plate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'payment.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  int totalPrice = 0;
  late Future<List<Store>> future_cart;
  String userID = "";
  String userToken = "";

  Future get_storedToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');
    setState(() {
      userID = y.toString();
      userToken = x.toString();
    });
  }

  Future<List<Store>> fetch_cartList(String userID, String userToken) async {
    final response = await http.get(
        Uri.parse('https://api.zeleex.com/api/cart/list?user_id=' +
            userID.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        });
    var jsonResponse = json.decode(response.body);

    List jsonCon = jsonResponse['data']['store'];

    for (var loop = 0; loop < jsonCon.length; loop++) {
      int eachStore_totalPrice =
          jsonResponse['data']['store'][loop]['price_tatal'];
      int parsed_total = eachStore_totalPrice;
      setState(() {
        totalPrice = totalPrice + parsed_total;
      });
    }

    if (response.statusCode == 200) {
      return jsonCon.map((data) => Store.fromJson(data)).toList();
    } else {
      throw Exception('error response status');
    }
  }

  @override
  void initState() {
    future_cart =
        fetch_cartList("529", "1296|udt2Cew91x169EJ7Iy2TGh01oUagO3xsNaGCwkCS");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Palette.kToDark)),
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Palette.kToDark,
          ),
          backgroundColor: Palette.kToDark,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "??????????????????????????????????????????",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.abc_sharp,
                color: Palette.kToDark,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder<List<Store>>(
                future: future_cart,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Store>? data = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 223, 222, 222)))),
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: 0.7,
                                        child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: Palette.kToDark,
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/cart_store.svg',
                                        color:
                                            Color.fromARGB(255, 104, 104, 104),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data![index].title.toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<List<ProductSkus>>(
                                    future: fetch_cartSku(
                                        "529",
                                        "1296|udt2Cew91x169EJ7Iy2TGh01oUagO3xsNaGCwkCS",
                                        index),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<ProductSkus>? data = snapshot.data;
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: data?.length,
                                            itemBuilder: (BuildContext context,
                                                int index222) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.7,
                                                      child: Checkbox(
                                                          checkColor:
                                                              Colors.white,
                                                          activeColor:
                                                              Palette.kToDark,
                                                          value: isChecked,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isChecked =
                                                                  value!;
                                                            });
                                                          }),
                                                    ),
                                                    Container(
                                                      color: Color.fromARGB(
                                                          167, 16, 193, 158),
                                                      child: Image.network(
                                                        data![index222]
                                                            .product!
                                                            .image!
                                                            .main
                                                            .toString(),
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  data[index222]
                                                                      .name
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            51,
                                                                            51,
                                                                            51),
                                                                  ),
                                                                ),
                                                                SvgPicture.asset(
                                                                    'assets/images/x.svg')
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  data[index222]
                                                                      .price
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Palette
                                                                          .kToDark,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              35,
                                                                          height:
                                                                              35,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Color.fromARGB(255, 130, 130, 130)),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          child: InkWell(
                                                                              onTap: () {},
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/minus.svg',
                                                                                  width: 20,
                                                                                ),
                                                                              )),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              30,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              //!counter
                                                                              data[index222].unit.toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              35,
                                                                          height:
                                                                              35,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Color.fromARGB(255, 130, 130, 130)),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          child: InkWell(
                                                                              onTap: () {},
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/pluss.svg',
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
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
                                ],
                              ),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0, top: 100),
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: Palette.kToDark,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        Text("?????????????????????")
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("?????????????????????????????? (?????????)",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 51, 51))),
                                    Text(
                                      // totalPrice.toString(),
                                      NumberFormat("#,###,###").format(
                                          int.parse(totalPrice.toString())),
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Palette.kToDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            color: Palette.kToDark,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "????????????????????????",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
