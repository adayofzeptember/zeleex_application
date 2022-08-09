import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Delete%20Method/Cart_Remove.dart';
import 'package:zeleex_application/API/Post%20Method/cart_update.dart';
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
  String? user_id = "";
  String? user_token = "";
  CartPage({Key? key, this.user_id, this.user_token}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  int totalPrice = 0;
  late Future<List<Store>> future_cart;
  late Provider_CartRemove _provider_cartRemove;
  late Provider_CartUpdate _provider_cartUpdate;
  String userID = "";
  String userToken = "";
  String realName = "";
  String? productName_forDialog;

  Future get_storedToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');
    setState(() {
      userID = y.toString();
      userToken = x.toString();
    });
  }

  Future<List<Store>> fetch_cartList(
      String userID222, String userToken222) async {
    final response = await http.get(
        Uri.parse('https://api.zeleex.com/api/cart/list?user_id=' +
            userID222.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'applicationjson',
          'Authorization': 'Bearer $userToken222',
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
    get_storedToken();
    future_cart =
        fetch_cartList(widget.user_id.toString(), widget.user_token.toString());
    _provider_cartRemove = Provider_CartRemove();
    _provider_cartUpdate = Provider_CartUpdate();
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
                'ตะกร้าสินค้า',
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
                                            Color.fromARGB(255, 141, 141, 141),
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
                                        color:
                                            Color.fromARGB(255, 141, 141, 141),
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<List<ProductSkus>>(
                                    future:
                                        fetch_cartSku(userID, userToken, index),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<ProductSkus>? data = snapshot.data;
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: data?.length,
                                            itemBuilder: (BuildContext context,
                                                int index222) {
                                              int x1 = int.parse(data![index222]
                                                  .price
                                                  .toString());
                                              int x2 = int.parse(data[index222]
                                                  .unit
                                                  .toString());
                                              int unit_price = x1 * x2;
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
                                                          83, 16, 193, 158),
                                                      child: Image.network(
                                                        data[index222]
                                                            .product!
                                                            .image!
                                                            .main
                                                            .toString(),
                                                        width: 100,
                                                        height: 100,
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
                                                              children: <
                                                                  Widget>[
                                                                Flexible(
                                                                  child:
                                                                      SizedBox(
                                                                    height: 20,
                                                                    child: Text(
                                                                      data[index222]
                                                                          .product!
                                                                          .title
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            51,
                                                                            51,
                                                                            51),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        _provider_cartRemove
                                                                            .cart_id = data[
                                                                                index222]
                                                                            .cartId
                                                                            .toString();
                                                                        realName = data[index222]
                                                                            .product!
                                                                            .title
                                                                            .toString();
                                                                        productName_forDialog = data[index222]
                                                                            .name
                                                                            .toString();
                                                                      });

                                                                      showDialog(
                                                                          _provider_cartRemove,
                                                                          userID,
                                                                          userToken,
                                                                          productName_forDialog
                                                                              .toString(),
                                                                          realName
                                                                              .toString());

                                                                      // show_deleteConfirmDialog(
                                                                      //     context,
                                                                      //     _provider_cartRemove,
                                                                      //     userID,
                                                                      //     userToken,
                                                                      //     productName_forDialog
                                                                      //         .toString(),
                                                                      //     realName
                                                                      //         .toString());
                                                                    },
                                                                    child: Text(
                                                                      'ลบ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'ตัวเลือกสินค้า: ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          141,
                                                                          141,
                                                                          141)),
                                                                ),
                                                                Text(
                                                                    data[index222]
                                                                        .name
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            141,
                                                                            141,
                                                                            141))),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 27,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '฿ ' +
                                                                      NumberFormat(
                                                                              "#,###,###")
                                                                          .format(
                                                                              int.parse(unit_price.toString())),
                                                                  style: TextStyle(
                                                                      color: Palette
                                                                          .kToDark,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                Row(
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
                                                                              onTap: () {
                                                                                _provider_cartUpdate.cart_id = data[index222].cartId.toString();
                                                                                _provider_cartUpdate.prd_unit = (x2 - 1).toString();
                                                                                print(json.encode(_provider_cartUpdate));
                                                                                print(userToken);
                                                                                update_cartUnit(_provider_cartUpdate, userToken);
                                                                                setState(() {
                                                                                  totalPrice = 0;
                                                                                });
                                                                                initState();
                                                                              },
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
                                                                              onTap: () {
                                                                                _provider_cartUpdate.cart_id = data[index222].cartId.toString();
                                                                                _provider_cartUpdate.prd_unit = (x2 + 1).toString();
                                                                                print(json.encode(_provider_cartUpdate));
                                                                                print(userToken);
                                                                                update_cartUnit(_provider_cartUpdate, userToken);
                                                                                setState(() {
                                                                                  totalPrice = 0;
                                                                                });

                                                                                initState();
                                                                              },
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
                    return Text("ไม่มีสินค้าในตะกร้า ");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 100, top: 100),
                    child: Text('โปรดรอสักครู่...'),
                  );
                },
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                height: 85,
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
                        Text("ทั้งหมด")
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
                                    Text("รวมทั้งหมด",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 51, 51))),
                                    Text(
                                      NumberFormat("#,###,###").format(
                                          int.parse(totalPrice.toString())),
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Palette.kToDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("บาท",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 51, 51))),
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
                                "ชำระเงิน",
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

//   show_deleteConfirmDialog(
//       BuildContext context,
//       Provider_CartRemove provider_remove_cart,
//       String dialogUserID,
//       String dialogUserToken,
//       String dialogPrdName,
//       String dialogPrdName_main) {
//     Widget cancelButton = TextButton(
  // child: Text(
  //     "ยกเลิก",
  //     style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
  //   ),
  //   onPressed: () {
  //     Navigator.of(context, rootNavigator: true).pop();
  //   },
  // );
  // Widget confirmButton = TextButton(
  //   style: ButtonStyle(
  //       backgroundColor:
  //           MaterialStateProperty.all(Color.fromARGB(117, 244, 67, 54))),
  //   child: Padding(
  //     padding: const EdgeInsets.fromLTRB(9, 1, 9, 1),
  //     child: Text(
  //       "ลบ",
  //       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  //     ),
  //   ),
  //   onPressed: () {
  //     cart_remove(provider_remove_cart, dialogUserToken);
  //     Fluttertoast.showToast(
  //         msg: "ลบ " + dialogPrdName + ' ออกจากตะกร้าแล้ว',
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 2,
  //         backgroundColor: Color.fromARGB(255, 133, 133, 133),
  //         textColor: Colors.white,
  //         fontSize: 15);
  //     Navigator.of(context, rootNavigator: true).pop();
  //     setState(() {
  //       totalPrice = 0;
  //       initState();
  //     });
  //     //initState();
  //   },
  // );

//     AlertDialog alert = AlertDialog(
//       title: Text("ลบสินค้าในตะกร้า",
//           style: TextStyle(color: Colors.red, fontSize: 20)),
//       content: Row(
//         children: [
//           Text(
//             "ต้องการลบสินค้า ",
//             style: TextStyle(
//               fontSize: 15,
//             ),
//           ),
//           Flexible(
//             child: Text(dialogPrdName_main.toString(),
//                 style: TextStyle(
//                     fontSize: 15,
//                     color: Palette.kToDark,
//                     fontWeight: FontWeight.bold)),
//           ),
//           Text(" ออกจากตะกร้า ?",
//               style: TextStyle(
//                 fontSize: 15,
//               )),
//         ],
//       ),
//       actions: [
//         cancelButton,
//         confirmButton,
//       ],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }

  void showDialog(Provider_CartRemove provider_remove_cart, String dialogUserID,
      String dialogUserToken, String dialogPrdName, String dialogPrdName_main) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoAlertDialog(
            title: Text( 
              "ลบสินค้าออกจากตะกร้า",
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "ต้องการลบ " + dialogPrdName_main + ' ออกจากตะกร้า ?',
                style: TextStyle(fontFamily: 'Kanit'),
                textAlign: TextAlign.start,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                  child: Text(
                    "ยกเลิก",
                    style: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoDialogAction(
                child: Text(
                  "ลบ",
                  style: TextStyle(fontFamily: 'Kanit', color: Colors.red),
                ),
                onPressed: () {
                  cart_remove(provider_remove_cart, dialogUserToken);
                  Fluttertoast.showToast(
                      msg: "ลบ " + dialogPrdName_main + ' ออกจากตะกร้าแล้ว',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Color.fromARGB(255, 133, 133, 133),
                      textColor: Colors.white,
                      fontSize: 15);
                  Navigator.of(context, rootNavigator: true).pop();
                  setState(() {
                    totalPrice = 0;
                    initState();
                  });
                },
              )
            ],
          ),
        );
      },
    );
  }
}
