import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/from%20Profile/my%20orders%20detail/ontheway_detail.dart';
import 'package:zeleex_application/from%20Profile/my%20orders%20detail/shipping_detail.dart';
import 'package:zeleex_application/from%20Profile/my%20orders%20detail/success_detail.dart';

import '../my orders detail/wait_toPay_detail.dart';

class History_Success extends StatefulWidget {
  History_Success({Key? key}) : super(key: key);

  @override
  State<History_Success> createState() => _History_SuccessState();
}

class _History_SuccessState extends State<History_Success> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Order_Sucess_Detail(),
              ),
            );
          },
          child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/cart_store.svg',
                                  color: Color.fromARGB(255, 104, 104, 104),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Zeleex Shop",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "สำเร็จ",
                              style: TextStyle(
                                  color: Palette.kToDark, fontSize: 10),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/cart_pd.png',
                              width: 90,
                              height: 90,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ยารักษาโรคติดเชื้อแบคทีเรีย",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "฿ 1,300",
                                          style: TextStyle(
                                              color: Palette.kToDark,
                                              fontSize: 20),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                SizedBox(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "จำนวน: 1",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("1 สินค้า, รวมทั้งสิ้น: "),
                        Text(
                          " ฿1,335",
                          style: TextStyle(color: Palette.kToDark),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              // side: BorderSide(color: Palette.kToDark),
                              primary: Palette.kToDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "ให้คะแนน",
                                style: TextStyle(color: Colors.white),
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
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
