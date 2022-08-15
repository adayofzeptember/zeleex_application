import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/shipping_list.dart';
import 'package:zeleex_application/payment_confirm.dart';
import 'API/Read All/cart_getUserCartList.dart';
import 'Plate.dart';
import 'cart.dart';
import 'payment_address.dart';
import 'payment_method.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum SingingCharacter { lafayette, jefferson }

class _PaymentPageState extends State<PaymentPage> {
  late Future<List<Data_Shipping_List>> fetched_data_shipping_list;
  List<bool> isSelected = [true, false];
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
    //!print(userID+userToken);
  }

  initState() {
    get_storedToken();
    super.initState();
  }

  SingingCharacter? _character = SingingCharacter.lafayette;
  int index = 0;
  switchClick(int index2) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index2) {
          isSelected[buttonIndex] = true;
          index = index2;
        } else {
          isSelected[buttonIndex] = false;
          index = index2;
        }
      }
    });

    print(index);
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
            // Status bar color
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    future: fetch_shipping_list(userToken),
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
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Payment_Address()));
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets
                                                        .fromLTRB(
                                                    25, 0, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          data![index]
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
                                                              data[index]
                                                                  .phone
                                                                  .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color:
                                                          Color.fromARGB(
                                                              255,
                                                              130,
                                                              130,
                                                              130),
                                                      size: 15,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets
                                                              .fromLTRB(
                                                          25, 0, 0, 0),
                                                  child: Container(
                                                    width: 250,
                                                    child: Row(
                                                      children: [
                                                        Text(data[index].address.toString() +
                                                            " " +
                                                            data[index]
                                                                .district
                                                                .toString() +
                                                            " " +
                                                            data[index]
                                                                .province
                                                                .toString() +
                                                            " " +
                                                            data[index]
                                                                .city
                                                                .toString() +
                                                            " " +
                                                            data[index]
                                                                .postcode
                                                                .toString()),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        );
                                      });
                                } else if (snapshot.hasError) {
                                  return Container();
                                }
                                return Container();
                                    },
                                  ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.fromLTRB(
                                //           25, 0, 0, 0),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               Text(
                                //                 "ชวันธร วีรจรรยาพันธ์",
                                //                 style: TextStyle(
                                //                     fontWeight:
                                //                         FontWeight.bold),
                                //               ),
                                //               SizedBox(
                                //                 width: 15,
                                //               ),
                                //               Text(
                                //                 "086-366-3928",
                                //               ),
                                //             ],
                                //           ),
                                //           Icon(
                                //             Icons.arrow_forward_ios_rounded,
                                //             color: Color.fromARGB(
                                //                 255, 130, 130, 130),
                                //             size: 15,
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //     Padding(
                                //         padding: const EdgeInsets.fromLTRB(
                                //             25, 0, 0, 0),
                                //         child: Container(
                                //           width: 250,
                                //           child: Text(
                                //               "369/11 เดชอุดม ซอย 6 ตำบลในเมือง อำเภอเมือง จังหวัดนครราชสีมา 30000"),
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      // FutureBuilder<List<ProductSkus>>(
                      //   future: fetch_cartSku(userID, userToken, index),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       List<ProductSkus>? data = snapshot.data;
                      //       return ListView.builder(
                      //           shrinkWrap: true,
                      //           itemCount: data?.length,
                      //           itemBuilder:
                      //               (BuildContext context, int index222) {
                      //             return Padding(
                      //                 padding:
                      //                     const EdgeInsets.only(bottom: 15),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Padding(
                      //                       padding: const EdgeInsets.fromLTRB(
                      //                           25, 0, 0, 0),
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Row(
                      //                             children: [
                      //                               Text(
                      //                                 "ชวันธร วีรจรรยาพันธ์",
                      //                                 style: TextStyle(
                      //                                     fontWeight:
                      //                                         FontWeight.bold),
                      //                               ),
                      //                               SizedBox(
                      //                                 width: 15,
                      //                               ),
                      //                               Text(
                      //                                 "086-366-3928",
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           Icon(
                      //                             Icons
                      //                                 .arrow_forward_ios_rounded,
                      //                             color: Color.fromARGB(
                      //                                 255, 130, 130, 130),
                      //                             size: 15,
                      //                           )
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                         padding:
                      //                             const EdgeInsets.fromLTRB(
                      //                                 25, 0, 0, 0),
                      //                         child: Container(
                      //                           width: 250,
                      //                           child: Text(
                      //                               "369/11 เดชอุดม ซอย 6 ตำบลในเมือง อำเภอเมือง จังหวัดนครราชสีมา 30000"),
                      //                         )),
                      //                   ],
                      //                 ));
                      //           });
                      //     } else if (snapshot.hasError) {
                      //       return Container();
                      //     }
                      //     return Container();
                      //   },
                      // ),
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
                      SizedBox(
                        height: 20,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      SvgPicture.asset('assets/images/x.svg')
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
                                            color:
                                                Color.fromARGB(255, 51, 51, 51),
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
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "จำนวน: 1",
                                                    textAlign: TextAlign.center,
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
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      Palette.kToDark),
                                              value: SingingCharacter.lafayette,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  print(value);
                                                  _character = value;
                                                });
                                              },
                                            ),
                                            Text(
                                              'บ้าน',
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Radio(
                                              fillColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      Palette.kToDark),
                                              value: SingingCharacter.jefferson,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                print(value);
                                                setState(() {
                                                  _character = value;
                                                });
                                              },
                                            ),
                                            Text(
                                              'ที่ทำงาน',
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
                              "คำสั่งซื้อทั้งหมด (จำนวน 1): ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "฿1,990",
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
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200]),
                          width: double.infinity,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'กรุณาระบุคูปองส่วนลด',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    'assets/images/ticket.svg',
                                    color: Colors.grey),
                              ),
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 214, 214, 214)),
                              fillColor: Color.fromARGB(179, 228, 14, 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      SizedBox(
                        height: 5,
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
                                          "ใบกำกับภาษีและข้อมูลติดต่อ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '*ที่อยู่ในการออกใบกำกับภาษี',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200]),
                                            width: double.infinity,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'ระบุที่อยู่',
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 214, 214, 214)),
                                                fillColor: Color.fromARGB(
                                                    179, 228, 14, 14),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'เลขประจำตัวผู้เสียภาษี',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200]),
                                            width: double.infinity,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    'ระบุเลขประจำตัวผู้เสียภาษี',
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 214, 214, 214)),
                                                fillColor: Color.fromARGB(
                                                    179, 228, 14, 14),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'สำนักงานใหญ่/รหัสสาขา (สำหรับบริษัท)',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200]),
                                            width: double.infinity,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    'ระบุข้อมูลสำนักงานใหญ่/รหัสสาขา สำหรับบริษัท',
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 214, 214, 214)),
                                                fillColor: Color.fromARGB(
                                                    179, 228, 14, 14),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Palette.kToDark,
                                              elevation: 0,
                                              // side: BorderSide(color: Colors.red),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "ยืนยัน",
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
                                }),
                              );
                            },
                          );
                        },
                        child: Text(
                          "ออกใบกำกับภาษี",
                          style: TextStyle(color: Palette.kToDark),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(color: Color.fromARGB(255, 227, 228, 227)),
                      SizedBox(
                        height: 10,
                      ),
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
                                  "฿1,300",
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
                                        "฿ 1,990",
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
