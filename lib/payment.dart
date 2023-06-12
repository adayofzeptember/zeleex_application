import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Delete%20Method/Cart_Remove.dart';
import 'package:zeleex_application/API/Read%20All/shipping_list.dart';
import 'package:zeleex_application/API/model.dart';
import 'package:zeleex_application/payment_confirm.dart';
import 'API/Post Method/post_checkout_IDEA.dart';
import 'API/Read All/cart_getUserCartList.dart';
import 'Others/Plate.dart';
import 'Screens/Address Pages/address_main_page.dart';
import 'cart.dart';
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
  AddressForCheckOut_Model address_checkout = AddressForCheckOut_Model();

  int radioID = 1;
  String gender = 'ไม่ระบุ';
  initState() {
    address_checkout = AddressForCheckOut_Model();

    setState(() {
      totalPrice = 0;
    });
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
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: ZeleexColor.zeleexGreen,
          ),
          backgroundColor: ZeleexColor.zeleexGreen,
          elevation: 0.0,
          title: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                "ชำระเงิน",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.abc_sharp,
                color: ZeleexColor.zeleexGreen,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
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
                                  builder: (context) => Address_Manage_Page()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: ZeleexColor.zeleexGreen)),
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "ที่อยู่สำหรับจัดส่ง",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  FutureBuilder<List<Data_Shipping_List>>(
                                    future: fetch_shipping_list(
                                        widget.user_token.toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Data_Shipping_List>? data =
                                            snapshot.data;

                                        address_checkout.address_id =
                                            data![0].id;
                                        address_checkout.address_name =
                                            data[0].name.toString();
                                        address_checkout.address_city =
                                            data[0].city.toString();
                                        address_checkout.address_district =
                                            data[0].district.toString();
                                        
                                        address_checkout.address_province =
                                            data[0].province.toString();
                                        address_checkout.address_postcode =
                                            data[0].postcode.toString();
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
                                                              data[0]
                                                                  .name
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
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
                                                            const Text('แก้ไข',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .red)),
                                                            const Icon(
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
                      const SizedBox(
                        height: 20,
                      ),

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
                                    decoration: const BoxDecoration(),
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
                                                color: const Color.fromARGB(
                                                    255, 141, 141, 141),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data![index9].title.toString(),
                                                style: const TextStyle(
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
                                                              const SizedBox(
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
                                                                    color: const Color
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
                                                                  const SizedBox(
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
                                                                                    style: const TextStyle(
                                                                                      color: Color.fromARGB(255, 51, 51, 51),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SvgPicture.asset('assets/images/x.svg')
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                NumberFormat("#,###,###").format(int.parse(unit_price.toString())) + ' บาท',
                                                                                style: const TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Text(
                                                                                            'จำนวน: ' + data[index222].unit.toString(),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
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
                            return const Padding(
                              padding:
                                  EdgeInsets.only(top: 50, bottom: 50),
                              child: Text('ไม่มีสินค้าในตะกร้า'),
                            );
                          } else {}
                          return const Padding(
                            padding:
                                EdgeInsets.only(bottom: 100, top: 100),
                            child: Text('โปรดรอสักครู่...'),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
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
                                        const Text(
                                          "ตัวเลือกการจัดส่งสินค้า",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
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
                                                          ZeleexColor
                                                              .zeleexGreen),
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
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          ZeleexColor
                                                              .zeleexGreen),
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
                                    color: const Color.fromARGB(255, 227, 228, 227))),
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "ตัวเลือกกการจัดส่งสินค้า",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "ส่งแบบธรรมดา",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text("฿35.00",
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
                                        child: const Text(
                                          "จะได้รับสินค้าในวันที่ 23 มี.ค.",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "คำสั่งซื้อทั้งหมด ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              NumberFormat("#,###,###").format(
                                      int.parse(totalPrice.toString())) +
                                  ' บาท',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: ZeleexColor.zeleexGreen),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
                                const Text(
                                  "ช่องทางการชำระเงินทั้งหมด",
                                  style: TextStyle(
                                      color: ZeleexColor.zeleexGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.arrow_right_outlined,
                                  color: ZeleexColor.zeleexGreen,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
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
                                    color: const Color.fromARGB(255, 227, 228, 227))),
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
                                      const VerticalDivider(
                                        width: 5,
                                      ),
                                      const Text(
                                        "ธนาคารกสิกรไทย (*3446)",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("บัตรเครดิต/เดบิต",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)))
                                ],
                              ),
                            ),
                          )),
                          const VerticalDivider(width: 5),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color.fromARGB(255, 227, 228, 227))),
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
                                      const VerticalDivider(
                                        width: 5,
                                      ),
                                      const Text(
                                        "เก็บเงินปลายทาง",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("ชำระเงินเมื่อได้รับสินค้า",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)))
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      //Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      const SizedBox(
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
                      //                         primary: ZeleexColor.zeleexGreen,
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
                      //     style: TextStyle(color: ZeleexColor.zeleexGreen),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      //Divider(color: Color.fromARGB(255, 227, 228, 227)),

                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ยอดการสั่งซื้อ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '฿' +
                                      NumberFormat("#,###,###").format(
                                          int.parse(totalPrice.toString())),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ยอดค่าจัดส่ง",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "฿45",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ยอดชำระเงินทั้งหมด",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Text(
                                  "฿1,345",
                                  style: TextStyle(
                                      color: ZeleexColor.zeleexGreen,
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
                  color: const Color.fromARGB(255, 240, 240, 240),
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
                                      const Text("รวมทั้งหมด",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51))),
                                      Text(
                                        '฿' +
                                            NumberFormat("#,###,###").format(
                                                int.parse(
                                                    totalPrice.toString())),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: ZeleexColor.zeleexGreen,
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
                              print('object');
                              fetch_checkOut(widget.user_token.toString());
                              // print(address_checkout.address_id);
                              // print(jsonEncode(address_checkout.toString()));

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Payment_Confirm(),
                              //   ),
                              // );
                            },
                            child: Container(
                              // alignment: Alignment.center,
                              // height: double.infinity,
                              color: ZeleexColor.zeleexGreen,
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "ชำระเงิน-",
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

  Future<void> fetch_checkOut(String token) async {
    Fluttertoast.showToast(
        msg: address_checkout.address_id.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: const Color.fromARGB(255, 230, 97, 97),
        textColor: Colors.white,
        fontSize: 15);
    var bigdata = {};
    var toAdd_storeData = [];
    var storeData = {};
    var toAdd_cartData = [];
    var cartData = {};

    bigdata["user_address_id"] = address_checkout.address_id.toString();
    bigdata["temp_address_name"] = address_checkout.address_name.toString();
    bigdata["temp_address_city"] = address_checkout.address_city.toString();
    bigdata["temp_address_district"] =
        address_checkout.address_district.toString();

    bigdata["temp_address_province"] =
        address_checkout.address_province.toString();
    bigdata["temp_address_postcode"] =
        address_checkout.address_postcode.toString();
    bigdata["payment_method"] = 'ชำระเงิน';
    bigdata["status"] = "created";

    bigdata["total_discount"] = 0;
    bigdata["total_amount"] = '/setstate loop';
    bigdata["total"] = totalPrice;
    bigdata["shipping_cost"] = 40;

    final response = await http
        .get(Uri.parse('https://admin.zeleex.com/api/cart/list'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'applicationjson',
      'Authorization': 'Bearer $token',
    });

    var jsonResponse = json.decode(response.body);

    List count_Store = jsonResponse['data']['store'];

    for (var i = 0; i < count_Store.length; i++) {
      storeData = {};

      storeData["store_id"] = count_Store[i]['id'].toString();

      List count_CartinStore = jsonResponse['data']['store'][i]['product_skus'];
//!----------------------------loop cart-------------------------------------------------------------------
      for (var x = 0; x < count_CartinStore.length; x++) {
        cartData = {};

        toAdd_cartData = [];

        cartData["id"] = '394';

        //print(jsonResponse['data']['store'][i]['product_skus'][x]['cart_id']);

        // print('ร้านที่: ' + count_Store[i]['id'].toString() +
        //     '    รหัส: ' +
        //     count_CartinStore[x]['cart_id'].toString());

        toAdd_cartData.add(cartData);
      }

      storeData["carts"] = toAdd_cartData;
      storeData["discount_id"] = 0;
      storeData["discount"] = 0;

      storeData["total"] = count_Store[i]['price_tatal'].toString();

      storeData["total_amount"] = 1;

      storeData["shipping_id"] = count_Store[0]['shipping'][0]['id'].toString();
      ;
      //count_Store[i]['shipping'][0]['id'].toString();
      storeData["shipping_cost"] =
          count_Store[0]['shipping'][0]['rate'][0]['price'].toString();

      toAdd_storeData.add(storeData);
    }

    bigdata["data"] = toAdd_storeData;

    print(jsonEncode(bigdata));

    String urlPost = "https://admin.zeleex.com/api/checkout";

    final response3 = await http.post(
      Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(bigdata),
    );

    print(response3.body);
  }
}
