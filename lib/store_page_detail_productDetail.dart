import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20By%20ID/product_id_api.dart';
import 'Plate.dart';
import 'store_page_detail_product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Store_Product_Detail extends StatefulWidget {
  String? productID = "";
  String? productName = "";
  Store_Product_Detail({Key? key, this.productID, this.productName})
      : super(key: key);

  @override
  State<Store_Product_Detail> createState() => _Store_Product_DetailState();
}

class _Store_Product_DetailState extends State<Store_Product_Detail> {
  int index = 0;
  void _onItemTapped(int index2) {
    setState(() {
      index = index2;
    });
  }

  bool pressed = true;
  int _counter = 0;
  void _pluss() {
    setState(() {
      _counter++;
    });
  }

  void _minus() {
    setState(() {
      _counter--;
      if (_counter <= 0) {
        _counter = 0;
      }
    });
  }

  Future<Product> fetch_Product_ByID() async {
    var url = "https://sanboxapi.zeleex.com/api/products/"+widget.productID.toString();
        widget.productID.toString();
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data']['product'];
    Product msg = Product.fromJson(jsonCon);
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {print("object")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/newcart.svg',
                      color: Palette.kToDark,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "เพิ่มในตะกร้า",
                      style: TextStyle(color: Palette.kToDark),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Palette.kToDark,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {print("object")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/dollar-circle.svg'),
                    SizedBox(
                      width: 5,
                    ),
                    Text("ซื้อสินค้า")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Text(widget.productName.toString(),
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/sort.svg',
                  ),
                  SvgPicture.asset(
                    'assets/images/cart123.svg',
                  )
                ],
              )
            ],
          )),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          FutureBuilder(
              future: fetch_Product_ByID(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  Product thisProduct = snapshot.data;
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          thisProduct.image!.thumbnail.toString(),
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
                                      Text(
                                        thisProduct.title.toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                            fontSize: 18),
                                      ),
                                      SvgPicture.asset('assets/images/love.svg')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "฿ ${thisProduct.price}",
                                        style: TextStyle(
                                            color: Colors.red[400],
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "฿ 250",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/groupStar.svg'),
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                _minus();
                                              },
                                              child: SvgPicture.asset(
                                                'assets/images/minus.svg',
                                                width: 20,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 130, 130, 130)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${_counter}",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                _pluss();
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/images/pluss.svg')),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(thisProduct
                                        .store!.image!.thumbnail
                                        .toString()),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(thisProduct.store!.title.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ImageIcon(
                                            AssetImage(
                                              "assets/images/store_pin.png",
                                            ),
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            child: Text(
                                              thisProduct.store!.address
                                                  .toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ImageIcon(
                                            AssetImage(
                                              "assets/images/phone.png",
                                            ),
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                thisProduct.store!.phone
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    primary: pressed
                                                        ? Palette.kToDark
                                                        : Color.fromARGB(
                                                            255, 204, 204, 204),
                                                    elevation: 0),
                                                onPressed: () {
                                                  setState(() {
                                                    pressed = !pressed;
                                                  });
                                                },
                                                child: Text(
                                                  pressed
                                                      ? "ติดตาม"
                                                      : "ติดตามแล้ว",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     SvgPicture.asset('assets/images/vec.svg')
                                //   ],
                                // ),
                                Text(
                                  "รายละเอียดสินค้า",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  thisProduct.description.toString(),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 130, 130, 130)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "คะแนนรีวิวสินค้า",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontSize: 20),
                                    ),
                                    Text("ทั้งหมด >",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("(5.0)"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                        'assets/images/groupStar.svg'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
          // Image.asset('assets/images/image21.png'),
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัว มทส",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 51, 51, 51),
          //                     fontSize: 18),
          //               ),
          //               SvgPicture.asset('assets/images/love.svg')
          //             ],
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 "฿ 350",
          //                 style:
          //                     TextStyle(color: Colors.red[400], fontSize: 20),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 "฿ 250",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 130, 130, 130),
          //                     decoration: TextDecoration.lineThrough),
          //               )
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               SvgPicture.asset('assets/images/groupStar.svg'),
          //               Row(
          //                 children: [
          //                   InkWell(
          //                       onTap: () {
          //                         _minus();
          //                       },
          //                       child: SvgPicture.asset(
          //                         'assets/images/minus.svg',
          //                         width: 20,
          //                       )),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   Container(
          //                     width: 40,
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color:
          //                                 Color.fromARGB(255, 130, 130, 130)),
          //                         borderRadius:
          //                             BorderRadius.all(Radius.circular(10))),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(8.0),
          //                       child: Text(
          //                         "${_counter}",
          //                         textAlign: TextAlign.center,
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   InkWell(
          //                       onTap: () {
          //                         _pluss();
          //                       },
          //                       child: SvgPicture.asset(
          //                           'assets/images/pluss.svg')),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ],
          //       )),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           height: 50,
          //           width: 50,
          //           child: CircleAvatar(
          //               child: Image.asset("assets/images/img.png")),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
          //                   style: TextStyle(fontWeight: FontWeight.bold)),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Row(
          //                 children: [
          //                   ImageIcon(
          //                     AssetImage(
          //                       "assets/images/store_pin.png",
          //                     ),
          //                     color: Colors.grey,
          //                   ),
          //                   Container(
          //                     child: Text(
          //                       "จ. สุราษฎธานี",
          //                       style: TextStyle(color: Colors.grey),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Row(
          //                 children: [
          //                   ImageIcon(
          //                     AssetImage(
          //                       "assets/images/phone.png",
          //                     ),
          //                     color: Colors.grey,
          //                   ),
          //                   Row(
          //                     children: [
          //                       Text(
          //                         "081 235 1234",
          //                         style: TextStyle(color: Colors.grey),
          //                       ),
          //                         SizedBox(width: 5,),
          //                       ElevatedButton(
          //                         style: ElevatedButton.styleFrom(
          //                             shape: RoundedRectangleBorder(
          //                               borderRadius: BorderRadius.circular(30),
          //                             ),
          //                             primary: pressed
          //                                 ? Palette.kToDark
          //                                 : Color.fromARGB(255, 204, 204, 204),
          //                             elevation: 0),
          //                         onPressed: () {
          //                           setState(() {
          //                             pressed = !pressed;
          //                           });
          //                         },

          //                         child: Text(
          //                           pressed ? "ติดตาม" : "ติดตามแล้ว",
          //                           style: TextStyle(
          //                               color:
          //                                   Color.fromRGBO(255, 255, 255, 1)),
          //                         ),
          //                       ),
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   width: double.infinity,
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [SvgPicture.asset('assets/images/vec.svg')],
          //         ),
          //         Text(
          //           "รายละเอียดสินค้า",
          //           style: TextStyle(
          //               color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           "อาหารวัว อาหารวัวขุน อาหารวัวนม อาหารวัวมทสอาหารอัดเม็ดไม่เป็นฝุ่นทำให้คุณค่าทางอาหารอยู่ครบถ้วนแน่นอน",
          //           style: TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
          //         ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   height: 200,
          //   width: double.infinity,
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               "คะแนนรีวิวสินค้า",
          //               style: TextStyle(
          //                   color: Color.fromARGB(255, 51, 51, 51),
          //                   fontSize: 20),
          //             ),
          //             Text("ทั้งหมด >",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 130, 130, 130)))
          //           ],
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Row(
          //           children: [
          //             Text("(5.0)"),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             SvgPicture.asset('assets/images/groupStar.svg'),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
