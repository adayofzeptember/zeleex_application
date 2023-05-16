import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Post%20Method/add_to_cart.dart';
import 'package:zeleex_application/API/Read%20By%20ID/product_id_api.dart';
import 'package:zeleex_application/API/Read%20By%20ID/product_review.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../API/Post Method/product_favorite.dart';
import '../API/Post Method/store_subscribe.dart';
import '../Others/Plate.dart';
import '../bloc/products/products_bloc.dart';

String theTokenOne = '';
String theUserOne = '';

class Product_Info_Page extends StatefulWidget {
  String? productID = "";
  String? productName = "";

  Product_Info_Page({Key? key, this.productID, this.productName})
      : super(key: key);

  @override
  State<Product_Info_Page> createState() => _Product_Info_PageState();
}

class _Product_Info_PageState extends State<Product_Info_Page> {
  int index = 0;
  int tag = 0;
  String picked = "";
  late Future<List<Skus>> future_Product_skus;
  late Future<List<Data_Review>> future_review;
  late AddToCart_Request request_model_addToCart;
  late Product_Fave_Model request_model_product_fave;
  late Store_Subscribe_Model request_model_store_subscribe;
  bool _press = false;
  var productImg = "";
  var productPrice = "";
  bool pressed = true;
  bool pressed_like = true;
  int _counter = 0;
  String cartAdd_userID = "";
  String cartAdd_storeID = "";
  String cartAdd_product_sku_id = "";
  String cartAdd_unit = "";
  String cartAdd_token = "";
  int pickedProductQTY = 0;
  String pickedProductSKuID = '';
  String pickedProductPrice = '';
  String pickedProductName = '';

  @override
  void initState() {
    getUserID();
    future_review = fetch_Product_Review();
    // context.read<ProductsBloc>().add(
    //       Load_SKUS(
    //         id: 118.toString(),
    //       ),
    //     );

    // future_Product_skus = fetch_skus();
    request_model_product_fave = Product_Fave_Model();
    request_model_addToCart = AddToCart_Request();
    request_model_store_subscribe = Store_Subscribe_Model();
    super.initState();
  }

  Future getUserID() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    String y = prefs2.get('keyID').toString();
    String x = prefs2.get('keyToken').toString();
    setState(() {
      cartAdd_userID = y;
      cartAdd_token = x;
    });
  }

  void _onItemTapped(int index2) {
    setState(() {
      index = index2;
    });
  }

  Future<List<Skus>> fetch_skus() async {
    final response = await http.get(Uri.parse(
        'https://api.zeleex.com/api/products/' + widget.productID.toString()));

    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data']['product']['skus'];

    if (response.statusCode == 200) {
      return jsonCon.map((data) => new Skus.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
  }

  Future cartCheckIn() async {
    request_model_addToCart.user_id = int.parse(cartAdd_userID.toString());
    request_model_addToCart.store_id = int.parse(cartAdd_storeID.toString());
    request_model_addToCart.product_sku_id =
        int.parse(cartAdd_product_sku_id.toString());
    request_model_addToCart.unit = int.parse(_counter.toString());
    await add_to_cart_now(request_model_addToCart, cartAdd_token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return Scaffold(
              body: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: JumpingText(
                  'กำลังโหลด...',
                  style: const TextStyle(
                      fontSize: 25,
                      color: ZeleexColor.zeleexGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ));
        } else
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 242, 242, 242),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark),
                centerTitle: true,
                title: Text(
                  widget.productName.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ZeleexColor.zeleexGreen),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                    ),
                  )
                ],
                leading: IconButton(
                  onPressed: () async {
                    context.read<ProductsBloc>().add(
                          Clear_Sku(),
                        );
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                )),
            body:
                //!
                SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Container(
                              color: const Color.fromARGB(255, 142, 142, 142),
                              height: 400,
                            ),
                            errorWidget: (context, url, error) => Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 141, 141, 141))),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          width: double.infinity,
                                          height: 300,
                                          child: const Center(
                                              child: Text(
                                                  "ไม่พบรูปภาพของสินค้า"))),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          state.product_info.title,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontSize: 18),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // request_model_product_fave
                                          //         .user_id =
                                          //     cartAdd_userID.toString();
                                          // request_model_product_fave
                                          //         .product_id =
                                          //     thisProduct.id.toString();
                                          // setState(() {
                                          //   pressed_like = !pressed_like;
                                          // });
                                          // user_product_favorite(
                                          //     request_model_product_fave,
                                          //     cartAdd_token);
                                          // print(cartAdd_userID.toString() +
                                          //     thisProduct.id.toString());
                                        },
                                        child: SvgPicture.asset(
                                            'assets/images/love.svg',
                                            color: pressed_like
                                                ? Colors.grey
                                                : Colors.red),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "฿ " + state.product_info.price.toString(),
                                    style: TextStyle(
                                        color: Colors.red[400], fontSize: 20),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                      state.product_info.store_img,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),

                                // CircleAvatar(
                                //   radius: 80,
                                //   child: ClipOval(
                                //     child: Image.network(
                                //        state.product_info.store_img,
                                //     ),
                                //   ),
                                // ),

                                // CachedNetworkImage(
                                //   imageUrl:
                                //       'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                //   imageBuilder: (context, imageProvider) =>
                                //       SizedBox(
                                //     width: 60,
                                //     height: 60,
                                // child: CircleAvatar(
                                //   child: Image.network(
                                //     'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                //     fit: BoxFit.contain,
                                //   ),
                                //     ),
                                //   ),
                                //   placeholder: (context, url) => CircleAvatar(
                                //     backgroundColor:
                                //         Color.fromARGB(255, 141, 141, 141),
                                //   ),
                                //   errorWidget: (context, url, error) => SizedBox(
                                //     height: 50,
                                //     width: 50,
                                //     child: CircleAvatar(
                                //       backgroundImage: NetworkImage(
                                //         'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                //       ),
                                //       backgroundColor: Colors.grey,
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.product_info.store_title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/pincat.svg',
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            child: Text(
                                              state.product_info.store_address,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/telcat.svg',
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                state.product_info.store_phone,
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                primary: pressed
                                                    ? ZeleexColor.zeleexGreen
                                                    : const Color.fromARGB(
                                                        255, 204, 204, 204),
                                                elevation: 0),
                                            onPressed: () {
                                              // request_model_store_subscribe
                                              //         .user_id =
                                              //     cartAdd_userID.toString();

                                              // request_model_store_subscribe
                                              //         .store_id =
                                              //     thisProduct.store!.id
                                              //         .toString();
                                              // user_store_subscribe(
                                              //     request_model_store_subscribe,
                                              //     cartAdd_token);
                                              // setState(() {
                                              //   pressed = !pressed;
                                              // });
                                            },
                                            child: Text(
                                              pressed ? "ติดตาม" : "ติดตามแล้ว",
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "รายละเอียด",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.product_info.store_description,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 130, 130, 130)),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: ZeleexColor.zeleexGreen,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter myState) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 90,
                                                height: 90,
                                                child: Image.network(
                                                  'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        '฿ ' +
                                                            pickedProductPrice,
                                                        // state.show_price
                                                        //     .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Divider(
                                                color: Color.fromARGB(
                                                    255, 206, 206, 206)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                "ตัวเลือกสินค้า: ",
                                                style: TextStyle(
                                                    color:
                                                        ZeleexColor.zeleexGreen,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                pickedProductName.toString(),
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontSize: 15),
                                              ),
                                              const Text(
                                                " จำนวน: ",
                                                style: TextStyle(
                                                    color:
                                                        ZeleexColor.zeleexGreen,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                pickedProductQTY.toString(),
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontSize: 15),
                                              ),
                                              const Text(
                                                " ชิ้น",
                                                style: TextStyle(
                                                    color:
                                                        ZeleexColor.zeleexGreen,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: RawScrollbar(
                                              thumbColor:
                                                  ZeleexColor.zeleexGreen,
                                              thickness: 5,
                                              child: GridView.builder(
                                                physics:
                                                    ClampingScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisExtent:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.09,
                                                ),
                                                itemCount:
                                                    state.product_skus.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        myState(() {
                                                          pickedProductSKuID =
                                                              state
                                                                  .product_skus[
                                                                      index]
                                                                  .sku_id;
                                                          pickedProductName =
                                                              state
                                                                  .product_skus[
                                                                      index]
                                                                  .sku_name;
                                                          pickedProductPrice =
                                                              state
                                                                  .product_skus[
                                                                      index]
                                                                  .sku_price;
                                                        });

                                                        // context
                                                        //     .read<
                                                        //         ProductsBloc>()
                                                        //     .add(
                                                        //       Show_SKUPrice(
                                                        //           thePrice: state
                                                        //               .product_skus[
                                                        //                   index]
                                                        //               .sku_price),
                                                        //     );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              state
                                                                  .product_skus[
                                                                      index]
                                                                  .sku_name,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 20,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        51,
                                                                        51,
                                                                        51),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  "จำนวนคงเหลือ: ",
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          131,
                                                                          131,
                                                                          131)),
                                                                ),
                                                                Text(state
                                                                    .product_skus[
                                                                        index]
                                                                    .sku_stock)
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Divider(
                                                color: Color.fromARGB(
                                                    255, 206, 206, 206)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "จำนวน",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InkWell(
                                                        onTap: () {
                                                          myState(() {
                                                            pickedProductQTY =
                                                                pickedProductQTY -
                                                                    1;

                                                            if (pickedProductQTY <
                                                                0) {
                                                              pickedProductQTY =
                                                                  0;
                                                            }
                                                          });
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/images/minus.svg',
                                                          width: 20,
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                130,
                                                                130,
                                                                130)),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        pickedProductQTY
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InkWell(
                                                        onTap: () {
                                                          myState(() {
                                                            pickedProductQTY =
                                                                pickedProductQTY +
                                                                    1;
                                                          });
                                                        },
                                                        child: SvgPicture.asset(
                                                            'assets/images/pluss.svg')),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    ZeleexColor.zeleexGreen,
                                                elevation: 0,
                                                // side: BorderSide(color: Colors.red),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                            onPressed: () {
                                              print('skud id: ' +
                                                  pickedProductSKuID);
                                              print('store id: ' +
                                                  state.product_info.store_id);
                                              print('unit: ' +
                                                  pickedProductQTY.toString());
                                              if (pickedProductQTY == 0) {}

                                              //  print(state.product_skus[index].sku_id);
                                              //   print(state
                                              //       .product_skus[index].sku_name);
                                              //   print(state
                                              //       .product_skus[index].sku_price);
                                              //   print(state
                                              //       .product_skus[index].sku_stock);
                                              // cartCheckIn();
                                              // Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "เพิ่มลงรถเข็น",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/newcart.svg',
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
