import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Delete%20Method/Cart_Remove.dart';
import 'package:zeleex_application/API/Read%20All/shipping_list.dart';
import 'package:zeleex_application/payment_confirm.dart';
import 'API/Read All/cart_getUserCartList.dart';
import 'Plate.dart';
import 'cart.dart';
import 'payment_address.dart';
import 'payment_method.dart';

int totalPrice = 0;

class PaymentPage extends StatefulWidget {
  String? user_id = "";
  String? user_token = "";
  PaymentPage({Key? key, this.user_id, this.user_token}) : super(key: key);
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum SingingCharacter { lafayette, jefferson }

SingingCharacter? _character = SingingCharacter.lafayette;

class _PaymentPageState extends State<PaymentPage> {
  late Future<List<Store>> future_cart;
  late Provider_CartRemove _provider_cartRemove;

  int radioID = 1;
  String gender = 'ไม่ระบุ';
  initState() {
    setState(() {
      totalPrice = 0;
    });
    print(widget.user_token.toString() + widget.user_id.toString());
    future_cart = fetch_cartList2(
        widget.user_id.toString(), widget.user_token.toString());
    super.initState();
  }

  Future<List<Store>> fetch_cartList2(
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
      print('error');
      throw Exception('error response status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
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
                "ชำระเงิน",
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
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment_Address()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Palette.kToDark)),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('assets/images/pin.svg'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "ที่อยู่สำหรับจัดส่ง",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  FutureBuilder<List<Data_Shipping_List>>(
                                    future: fetch_shipping_list(
                                        widget.user_token.toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Data_Shipping_List>? data =
                                            snapshot.data;
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index222) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(25, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              data![0]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              "เบอร์โทร: " +
                                                                  data[0]
                                                                      .phone
                                                                      .toString(),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text('แก้ไข',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .red)),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios_rounded,
                                                              color: Colors.red,
                                                              size: 15,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          25, 0, 0, 0),
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(data[0]
                                                                .address
                                                                .toString()),
                                                            Text(data[0]
                                                                .district
                                                                .toString()),
                                                            Text(
                                                              data[0]
                                                                      .province
                                                                      .toString() +
                                                                  ' ' +
                                                                  data[0]
                                                                      .city
                                                                      .toString(),
                                                            ),
                                                            Text(
                                                              data[0]
                                                                  .postcode
                                                                  .toString(),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              );
                                            });
                                      } else if (snapshot.hasError) {
                                        return Container();
                                      }
                                      return Container();
                                    },
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       'assets/images/cart_store.svg',
                      //       color: Color.fromARGB(255, 104, 104, 104),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       "Zeleex Shop",
                      //       style: TextStyle(
                      //           color: Color.fromARGB(255, 51, 51, 51),
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Image.asset(
                      //       'assets/images/cart_pd.png',
                      //       width: 90,
                      //       height: 90,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.stretch,
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   "ยารักษาโรคติดเชื้อแบคทีเรีย",
                      //                   style: TextStyle(
                      //                     color:
                      //                         Color.fromARGB(255, 51, 51, 51),
                      //                   ),
                      //                 ),
                      //                 SvgPicture.asset('assets/images/x.svg')
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: 30,
                      //             ),
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   "฿ 1,300",
                      //                   style: TextStyle(
                      //                       color:
                      //                           Color.fromARGB(255, 51, 51, 51),
                      //                       fontSize: 20),
                      //                 ),
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         SizedBox(
                      //                           width: 5,
                      //                         ),
                      //                         SizedBox(
                      //                           child: Padding(
                      //                             padding:
                      //                                 const EdgeInsets.all(8.0),
                      //                             child: Text(
                      //                               "จำนวน: 1",
                      //                               textAlign: TextAlign.center,
                      //                               style: TextStyle(
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 5,
                      //                         ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      FutureBuilder<List<Store>>(
                        future: future_cart,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Store>? data = snapshot.data;
                            return ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: data?.length,
                                itemBuilder:
                                    (BuildContext context, int index9) {
                                  return Container(
                                    decoration: BoxDecoration(),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/cart_store.svg',
                                                color: Color.fromARGB(
                                                    255, 141, 141, 141),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data![index9].title.toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          FutureBuilder<List<ProductSkus>>(
                                            future: fetch_cartSku(
                                                widget.user_id.toString(),
                                                widget.user_token.toString(),
                                                index9),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                List<ProductSkus>? data =
                                                    snapshot.data;
                                                return ListView.builder(
                                                    shrinkWrap: true,
                                                    primary: false,
                                                    itemCount: data?.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index222) {
                                                      int x1 = int.parse(
                                                          data![index222]
                                                              .price
                                                              .toString());
                                                      int x2 = int.parse(
                                                          data[index222]
                                                              .unit
                                                              .toString());
                                                      int unit_price = x1 * x2;
                                                      return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            83,
                                                                            16,
                                                                            193,
                                                                            158),
                                                                    child: Image
                                                                        .network(
                                                                      data[index222]
                                                                          .product!
                                                                          .image!
                                                                          .main
                                                                          .toString(),
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: SizedBox(
                                                                                  height: 20,
                                                                                  child: Text(
                                                                                    data[index222].product!.title.toString(),
                                                                                    style: TextStyle(
                                                                                      color: Color.fromARGB(255, 51, 51, 51),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SvgPicture.asset('assets/images/x.svg')
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                NumberFormat("#,###,###").format(int.parse(unit_price.toString())) + ' บาท',
                                                                                style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Text(
                                                                                            'จำนวน: ' + data[index222].unit.toString(),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
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
                                                            ],
                                                          ));
                                                    });
                                              } else if (snapshot.hasError) {
                                                return Container();
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
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: Text('ไม่มีสินค้าในตะกร้า'),
                            );
                          } else {}
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: 100, top: 100),
                            child: Text('โปรดรอสักครู่...'),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            )),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                child: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter stateSetter) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "ตัวเลือกการจัดส่งสินค้า",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          Palette.kToDark),
                                                  value: 1,
                                                  groupValue: radioID,
                                                  onChanged: (val) {
                                                    stateSetter(() {
                                                      gender = 'หญิง';
                                                      radioID = 1;
                                                    });
                                                    print(gender);
                                                  },
                                                ),
                                                Text(
                                                  'บ้าน',
                                                  style: new TextStyle(
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          Palette.kToDark),
                                                  value: 2,
                                                  groupValue: radioID,
                                                  onChanged: (val) {
                                                    stateSetter(() {
                                                      gender = 'ชาย';
                                                      radioID = 2;
                                                    });
                                                    print(gender);
                                                  },
                                                ),
                                                Text(
                                                  'ที่ทำงาน',
                                                  style: new TextStyle(
                                                      fontSize: 17.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   children: <Widget>[
                                        //     Radio(
                                        //       fillColor: MaterialStateColor
                                        //           .resolveWith((states) =>
                                        //               Palette.kToDark),
                                        //       value: SingingCharacter.lafayette,
                                        //       groupValue: _character,
                                        //       onChanged:
                                        //           (SingingCharacter? value) {
                                        //         stateSetter(() {
                                        //           print(value);
                                        //           _character = value;
                                        //         });
                                        //       },
                                        //     ),
                                        //     Text(
                                        //       'บ้าน',
                                        //     ),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Radio(
                                        //       fillColor: MaterialStateColor
                                        //           .resolveWith((states) =>
                                        //               Palette.kToDark),
                                        //       value: SingingCharacter.jefferson,
                                        //       groupValue: _character,
                                        //       onChanged:
                                        //           (SingingCharacter? value) {
                                        //         print(value);
                                        //         stateSetter(() {
                                        //           _character = value;
                                        //         });
                                        //       },
                                        //     ),
                                        //     Text(
                                        //       'ที่ทำงาน',
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 227, 228, 227))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/ship.svg'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "ตัวเลือกกการจัดส่งสินค้า",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ส่งแบบธรรมดา",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text("฿35.00",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 5, 0, 0),
                                      child: Container(
                                        width: 250,
                                        child: Text(
                                          "จะได้รับสินค้าในวันที่ 23 มี.ค.",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "คำสั่งซื้อทั้งหมด ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              NumberFormat("#,###,###").format(
                                      int.parse(totalPrice.toString())) +
                                  ' บาท',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Palette.kToDark),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เลือกวิธีชำระเงิน",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Payment_Method(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "ช่องทางการชำระเงินทั้งหมด",
                                  style: TextStyle(
                                      color: Palette.kToDark,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_right_outlined,
                                  color: Palette.kToDark,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 227, 228, 227))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/cash.svg',
                                      ),
                                      VerticalDivider(
                                        width: 5,
                                      ),
                                      Text(
                                        "ธนาคารกสิกรไทย (*3446)",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("บัตรเครดิต/เดบิต",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)))
                                ],
                              ),
                            ),
                          )),
                          VerticalDivider(width: 5),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 227, 228, 227))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/cash.svg',
                                      ),
                                      VerticalDivider(
                                        width: 5,
                                      ),
                                      Text(
                                        "เก็บเงินปลายทาง",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("ชำระเงินเมื่อได้รับสินค้า",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)))
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Colors.grey[200]),
                      //     width: double.infinity,
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //         hintText: 'กรุณาระบุคูปองส่วนลด',
                      //         prefixIcon: Padding(
                      //           padding: EdgeInsets.all(10.0),
                      //           child: SvgPicture.asset(
                      //               'assets/images/ticket.svg',
                      //               color: Colors.grey),
                      //         ),
                      //         hintStyle: TextStyle(
                      //             color: Color.fromARGB(255, 214, 214, 214)),
                      //         fillColor: Color.fromARGB(179, 228, 14, 14),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10.0)),
                      //           borderSide: BorderSide(
                      //               color: Colors.transparent, width: 0),
                      //         ),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10.0)),
                      //           borderSide: BorderSide(
                      //               color: Colors.transparent, width: 0),
                      //         ),
                      //       ),
                      //     )),
                      SizedBox(
                        height: 10,
                      ),
                      //Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      SizedBox(
                        height: 5,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     showModalBottomSheet(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.vertical(
                      //         top: Radius.circular(20),
                      //       )),
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return Container(
                      //           child: StatefulBuilder(builder:
                      //               (BuildContext context,
                      //                   StateSetter stateSetter) {
                      //             return Padding(
                      //               padding: const EdgeInsets.all(20.0),
                      //               child: Column(
                      //                 children: [
                      //                   Text(
                      //                     "ใบกำกับภาษีและข้อมูลติดต่อ",
                      //                     style: TextStyle(fontSize: 18),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 40,
                      //                   ),
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.start,
                      //                     children: <Widget>[
                      //                       Text(
                      //                         '*ที่อยู่ในการออกใบกำกับภาษี',
                      //                         style: TextStyle(
                      //                             color: Color.fromARGB(
                      //                                 255, 51, 51, 51),
                      //                             fontSize: 15),
                      //                       )
                      //                     ],
                      //                   ),
                      //                   Container(
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(10),
                      //                           color: Colors.grey[200]),
                      //                       width: double.infinity,
                      //                       child: TextField(
                      //                         decoration: InputDecoration(
                      //                           hintText: 'ระบุที่อยู่',
                      //                           hintStyle: TextStyle(
                      //                               color: Color.fromARGB(
                      //                                   255, 214, 214, 214)),
                      //                           fillColor: Color.fromARGB(
                      //                               179, 228, 14, 14),
                      //                           enabledBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                           focusedBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                         ),
                      //                       )),
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.start,
                      //                     children: <Widget>[
                      //                       Text(
                      //                         'เลขประจำตัวผู้เสียภาษี',
                      //                         style: TextStyle(
                      //                             color: Color.fromARGB(
                      //                                 255, 51, 51, 51),
                      //                             fontSize: 15),
                      //                       )
                      //                     ],
                      //                   ),
                      //                   Container(
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(10),
                      //                           color: Colors.grey[200]),
                      //                       width: double.infinity,
                      //                       child: TextField(
                      //                         decoration: InputDecoration(
                      //                           hintText:
                      //                               'ระบุเลขประจำตัวผู้เสียภาษี',
                      //                           hintStyle: TextStyle(
                      //                               color: Color.fromARGB(
                      //                                   255, 214, 214, 214)),
                      //                           fillColor: Color.fromARGB(
                      //                               179, 228, 14, 14),
                      //                           enabledBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                           focusedBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                         ),
                      //                       )),
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.start,
                      //                     children: <Widget>[
                      //                       Text(
                      //                         'สำนักงานใหญ่/รหัสสาขา (สำหรับบริษัท)',
                      //                         style: TextStyle(
                      //                             color: Color.fromARGB(
                      //                                 255, 51, 51, 51),
                      //                             fontSize: 15),
                      //                       )
                      //                     ],
                      //                   ),
                      //                   Container(
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(10),
                      //                           color: Colors.grey[200]),
                      //                       width: double.infinity,
                      //                       child: TextField(
                      //                         decoration: InputDecoration(
                      //                           hintText:
                      //                               'ระบุข้อมูลสำนักงานใหญ่/รหัสสาขา สำหรับบริษัท',
                      //                           hintStyle: TextStyle(
                      //                               color: Color.fromARGB(
                      //                                   255, 214, 214, 214)),
                      //                           fillColor: Color.fromARGB(
                      //                               179, 228, 14, 14),
                      //                           enabledBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                           focusedBorder:
                      //                               OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.all(
                      //                                     Radius.circular(
                      //                                         10.0)),
                      //                             borderSide: BorderSide(
                      //                                 color: Colors.transparent,
                      //                                 width: 0),
                      //                           ),
                      //                         ),
                      //                       )),
                      //                   SizedBox(
                      //                     height: 20,
                      //                   ),
                      //                   ElevatedButton(
                      //                     style: ElevatedButton.styleFrom(
                      //                         primary: Palette.kToDark,
                      //                         elevation: 0,
                      //                         // side: BorderSide(color: Colors.red),
                      //                         shape: RoundedRectangleBorder(
                      //                           borderRadius:
                      //                               BorderRadius.circular(15),
                      //                         )),
                      //                     onPressed: () {
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(20.0),
                      //                       child: Container(
                      //                         alignment: Alignment.center,
                      //                         child: Text(
                      //                           "ยืนยัน",
                      //                           style: TextStyle(
                      //                               color: Colors.white,
                      //                               fontSize: 15),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             );
                      //           }),
                      //         );
                      //       },
                      //     );
                      //   },
                      //   child: Text(
                      //     "ออกใบกำกับภาษี",
                      //     style: TextStyle(color: Palette.kToDark),
                      //   ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      //Divider(color: Color.fromARGB(255, 227, 228, 227)),

                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ยอดการสั่งซื้อ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '฿' +
                                      NumberFormat("#,###,###").format(
                                          int.parse(totalPrice.toString())),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ยอดค่าจัดส่ง",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "฿45",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ยอดชำระเงินทั้งหมด",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "฿1,345",
                                  style: TextStyle(
                                      color: Palette.kToDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 240, 240, 240),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                        '฿' +
                                            NumberFormat("#,###,###").format(
                                                int.parse(
                                                    totalPrice.toString())),
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
                                  builder: (context) => Payment_Confirm(),
                                ),
                              );
                            },
                            child: Container(
                              // alignment: Alignment.center,
                              // height: double.infinity,
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
      ),
    );
  }
}
