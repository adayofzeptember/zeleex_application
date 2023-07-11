import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:zeleex_application/API/Delete%20Method/Cart_Remove.dart';
import 'package:zeleex_application/API/Post%20Method/cart_update.dart';
import 'package:zeleex_application/API/Read%20All/cart_getUserCartList.dart';
import 'Others/Plate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'bloc/cart/cart_bloc.dart';
import 'payment.dart';

class CartPage extends StatefulWidget {
  CartPage() : super();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  int totalPrice = 0;
  int lol = 0;
  late Future<List<Store>> future_cart;
  late Provider_CartRemove _provider_cartRemove;
  late Provider_CartUpdate _provider_cartUpdate;
  String userID = "";
  String userToken = "";
  String realName = "";
  String? productName_forDialog;

  Future<List<ProductSkus>> fetch_cartSku(
      String userID, String userToken, int x) async {
    final response = await http.get(
        Uri.parse(
            'https://api.zeleex.com/api/car                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     t/list?user_id=' +
                userID.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        });

    final jsonResponse = json.decode(response.body) as Map<dynamic, dynamic>;
    //var jsonConTest = jsonResponse['data']['store'][0];
    //var x = jsonResponse['data']['product_all'];
    List jsonCon = jsonResponse['data']['store'][x]['product_skus'];

    if (response.statusCode == 200) {
      return jsonCon.map((data) => ProductSkus.fromJson(data)).toList();
    } else {
      throw Exception('error response =! 200');
    }
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
      //return [];
      throw Exception('error response status');
    }
  }

  @override
  void initState() {
    context.read<CartBloc>().add(Load_Cart_Store());

    // _provider_cartRemove = Provider_CartRemove();
    // _provider_cartUpdate = Provider_CartUpdate();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ZeleexColor.zeleexGreen,
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ZeleexColor.zeleexGreen,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light),
          centerTitle: true,
          title: const Text(
            'ตะกร้าสินค้า',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          )),
      body: SingleChildScrollView(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(
                child:
                    CircularProgressIndicator(color: ZeleexColor.zeleexGreen),
              );
            }

            return Column(
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: state.cart_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      context
                          .read<CartBloc>()
                          .add(Load_Cart_Store_SKU(getStoreIndex: index));
                      return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                        Color.fromARGB(255, 223, 222, 222)))),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: ZeleexColor.zeleexGreen,
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        }),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/cart_store.svg',
                                    color: const Color.fromARGB(
                                        255, 141, 141, 141),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      print('id store: ' +
                                          state.cart_list[index].id.toString());
                                    }),
                                    child: Text(
                                      state.cart_list[index].title.toString(),
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 141, 141, 141),
                                    size: 15,
                                  ),
                                ],
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: state.cart_list_sku.length,
                                  itemBuilder:
                                      (BuildContext context, int index_sku) {







                            
                                    // context.read<CartBloc>().add(
                                    //     Load_Cart_Store_SKU(
                                    //         getStoreIndex: index));
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Flexible(
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            state
                                                                .cart_list_sku[
                                                                    index_sku]
                                                                .sku_title,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color
                                                                  .fromARGB(
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
                                                            // setState(
                                                            //     () {
                                                            //   _provider_cartRemove
                                                            //       .cart_id = data[
                                                            //           index222]
                                                            //       .cartId
                                                            //       .toString();
                                                            //   realName = data[
                                                            //           index222]
                                                            //       .product!
                                                            //       .title
                                                            //       .toString();
                                                            //   productName_forDialog = data[
                                                            //           index222]
                                                            //       .name
                                                            //       .toString();
                                                            // });

                                                            // showDialog(
                                                            //     _provider_cartRemove,
                                                            //     userID,
                                                            //     userToken,
                                                            //     productName_forDialog
                                                            //         .toString(),
                                                            //     realName
                                                            //         .toString());
                                                          },
                                                          child: const Text(
                                                            'ลบ',
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'ตัวเลือกสินค้า: ',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    141,
                                                                    141,
                                                                    141)),
                                                      ),
                                                      const Text('sdfsdf',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      141,
                                                                      141,
                                                                      141))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                      );
                    }),
                Container(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: ZeleexColor.zeleexGreen,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text("ทั้งหมด")
                        ],
                      ),
                      Row(
                        ///*
                        //?

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
                                        NumberFormat("#,###,###").format(
                                            int.parse(totalPrice.toString())),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: ZeleexColor.zeleexGreen,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text("บาท",
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
                                      builder: (context) => PaymentPage(
                                            user_id: userID,
                                            user_token: userToken,
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: double.infinity,
                              color: ZeleexColor.zeleexGreen,
                              child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "ชำระเงิน",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void showDialog(Provider_CartRemove provider_remove_cart, String dialogUserID,
      String dialogUserToken, String dialogPrdName, String dialogPrdName_main) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoAlertDialog(
            title: const Text(
              "ลบสินค้าออกจากตะกร้า",
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "ต้องการลบ " + dialogPrdName_main + ' ออกจากตะกร้า ?',
                style: const TextStyle(fontFamily: 'Kanit'),
                textAlign: TextAlign.start,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                  child: const Text(
                    "ยกเลิก",
                    style: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoDialogAction(
                child: const Text(
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
                      backgroundColor: const Color.fromARGB(255, 133, 133, 133),
                      textColor: Colors.white,
                      fontSize: 15);
                  Navigator.of(context, rootNavigator: true).pop();
                  setState(() {
                    totalPrice = 0;
                    initState();
                  });
                  initState();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
