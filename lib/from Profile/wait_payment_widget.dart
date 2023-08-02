import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20All/order_topay.dart';
import 'package:zeleex_application/main.dart';
import '../Others/Plate.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(First_Page()));
}

//? widget ที่เอาไปใส่ในแท็บ buying list
class Wait_Payment extends StatefulWidget {
  Wait_Payment({Key? key}) : super(key: key);

  @override
  State<Wait_Payment> createState() => _Wait_PaymentState();
}

class _Wait_PaymentState extends State<Wait_Payment> {
 // Future<List<OrderItem>> futureOrderToPay;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        FutureBuilder<List<OrderItem>>(
          future: fetch_Order_Topay(
              '1891|bw9t9hPicOAQwjdyXIRLosdUbmC0EGu4hhzuDrwU'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<OrderItem>? data = snapshot.data;
              return Expanded(
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/cart_store.svg',
                                              color: Color.fromARGB(
                                                  255, 104, 104, 104),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'ร้านค้า',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Color.fromARGB(
                                                155, 236, 137, 130),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "ที่ต้องชำระเงิน",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          data![index]
                                              .sku!
                                              .product!
                                              .image!
                                              .main
                                              .toString(),
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
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
                                                  children: [
                                                    Text(
                                                      data[index]
                                                          .sku!
                                                          .product!
                                                          .title
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 51, 51),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "฿ " +
                                                          data[index]
                                                              .productAmounts
                                                              .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              ZeleexColor.zeleexGreen,
                                                          fontSize: 20),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            SizedBox(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                  "x " +
                                                                      data[index]
                                                                          .sku!
                                                                          .order
                                                                          .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
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
                                ),
                              ),
                              Divider(
                                color: Color.fromARGB(255, 216, 216, 216),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("คำสั่งซื้อทั้งหมด (จำนวน 1): "),
                                  Text(
                                    " ฿1,335",
                                    style: TextStyle(color: ZeleexColor.zeleexGreen),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                              Divider(
                                color: Color.fromARGB(255, 216, 216, 216),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "กรุณาชำระเงินก่อนวันที่ 20-03-2022"),
                                        Text("ช่องทาง ตัดบัญชีธนาคาร")
                                      ],
                                    ),
                                  
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          // side: BorderSide(color: ZeleexColor.zeleexGreen),
                                          primary: ZeleexColor.zeleexGreen,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "ชำระเงินตอนนี้",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
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

            return CircularProgressIndicator();
          },
        )
        // Container(
        //   color: Colors.white,
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 8.0),
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/images/cart_store.svg',
        //                         color: Color.fromARGB(255, 104, 104, 104),
        //                       ),
        //                       SizedBox(
        //                         width: 10,
        //                       ),
        //                       Text(
        //                         "Zeleex ผมอาจจะ",
        //                         style: TextStyle(
        //                             color: Color.fromARGB(255, 51, 51, 51),
        //                             fontWeight: FontWeight.bold),
        //                       ),
        //                     ],
        //                   ),
        //                   Container(
        //                     decoration: BoxDecoration(
        //                       borderRadius:
        //                           BorderRadius.all(Radius.circular(5)),
        //                       color: Color.fromARGB(155, 236, 137, 130),
        //                     ),
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(2.0),
        //                       child: Text(
        //                         "ที่ต้องชำระเงิน",
        //                         style: TextStyle(color: Colors.red),
        //                       ),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Image.asset(
        //                     'assets/images/cart_pd.png',
        //                     width: 90,
        //                     height: 90,
        //                   ),
        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   Expanded(
        //                     child: Container(
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.stretch,
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               Text(
        //                                 "ยารักษาโรคติดเชื้อแบคทีเรีย",
        //                                 style: TextStyle(
        //                                   color:
        //                                       Color.fromARGB(255, 51, 51, 51),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: 30,
        //                           ),
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               Text(
        //                                 "฿ 1,300",
        //                                 style: TextStyle(
        //                                     color: ZeleexColor.zeleexGreen,
        //                                     fontSize: 20),
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Row(
        //                                     children: [
        //                                       SizedBox(
        //                                         width: 5,
        //                                       ),
        //                                       SizedBox(
        //                                         child: Padding(
        //                                           padding:
        //                                               const EdgeInsets.all(8.0),
        //                                           child: Text(
        //                                             "x1",
        //                                             textAlign: TextAlign.center,
        //                                             style: TextStyle(
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         width: 5,
        //                                       ),
        //                                     ],
        //                                   )
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         Divider(
        //           color: Color.fromARGB(255, 216, 216, 216),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Text("คำสั่งซื้อทั้งหมด (จำนวน 1): "),
        //             Text(
        //               " ฿1,335",
        //               style: TextStyle(color: ZeleexColor.zeleexGreen),
        //             ),
        //             SizedBox(
        //               width: 5,
        //             )
        //           ],
        //         ),
        //         Divider(
        //           color: Color.fromARGB(255, 216, 216, 216),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text("กรุณาชำระเงินก่อนวันที่ 20-03-2022"),
        //                   Text("ช่องทาง ตัดบัญชีธนาคาร")
        //                 ],
        //               ),
        //               ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                     elevation: 0,
        //                     // side: BorderSide(color: ZeleexColor.zeleexGreen),
        //                     primary: ZeleexColor.zeleexGreen,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(5),
        //                     )),
        //                 onPressed: () {},
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.all(Radius.circular(5)),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(2.0),
        //                     child: Text(
        //                       "ชำระเงินตอนนี้",
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
