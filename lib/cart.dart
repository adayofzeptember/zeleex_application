import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20All/cart_getUserCartList.dart';
import 'package:zeleex_application/main%206%20pages/main_widget.dart';
import 'package:zeleex_application/register.dart';
import 'API/model.dart';
import 'Plate.dart';
import 'payment.dart';
//! วนลูปไล่ sku ไม่หมด มาแค่อย่างละ 2 ชิ้น เพราะ index แรกมีแค่ 2 ตัว 
//* ลอง!!! เก็บค่า all product มาไว้ใน state แล้วเอามาใส่ในวพกวนลูป data snapshot
 
class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
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

  @override
  void initState() {
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
                "สินค้าในรถเข็น",
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
                future: fetch_cartList(
                    "529", "1296|udt2Cew91x169EJ7Iy2TGh01oUagO3xsNaGCwkCS"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Store>? data = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
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
                                  const EdgeInsets.only(right: 10, bottom: 20),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder<List<Store>>(
                                    future: fetch_cartList("529",
                                        "1296|udt2Cew91x169EJ7Iy2TGh01oUagO3xsNaGCwkCS"),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Store>? data = snapshot.data;
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: data?.length,
                                            itemBuilder: (BuildContext context,
                                                int index222) {
                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 15),
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
                                                              isChecked = value!;
                                                            });
                                                          }),
                                                    ),
                                                    Container(
                                                      color: Palette.kToDark,
                                                      child: Image.network(
                                                          data![index]
                                                                        .productSkus![
                                                                            index222]
                                                                        .product!.image!.main.toString(),
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
                                                                  data[index]
                                                                      .productSkus![
                                                                          index222]
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
                                                                    data[index]
                                                                      .productSkus![
                                                                          index222]
                                                                      .price.toString(),
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
                                                                              border:
                                                                                  Border.all(color: Color.fromARGB(255, 130, 130, 130)),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          child: InkWell(
                                                                              onTap: () {
                                                                                _minus();
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
                                                                                  //!counter
                                                                                data[index]
                                                                      .productSkus![
                                                                          index222]
                                                                      .unit
                                                                      .toString(),
                                                                              textAlign:
                                                                                  TextAlign.center,
                                                                              style:
                                                                                  TextStyle(fontWeight: FontWeight.bold),
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
                                                                              border:
                                                                                  Border.all(color: Color.fromARGB(255, 130, 130, 130)),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          child: InkWell(
                                                                              onTap: () {
                                                                                _pluss();
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
                                      return CircularProgressIndicator();
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
                  return CircularProgressIndicator();
                },
              ),

              //  Row(
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Transform.scale(
              //                           scale: 0.7,
              //                           child: Checkbox(
              //                               checkColor: Colors.white,
              //                               activeColor: Palette.kToDark,
              //                               value: isChecked,
              //                               onChanged: (value) {
              //                                 setState(() {
              //                                   isChecked = value!;
              //                                 });
              //                               }),
              //                         ),
              //                         Image.asset(
              //                           'assets/images/cart_pd.png',
              //                           width: 90,
              //                           height: 90,
              //                         ),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Expanded(
              //                           child: Container(
              //                             child: Column(
              //                               crossAxisAlignment: CrossAxisAlignment.stretch,
              //                               children: [
              //                                 Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.spaceBetween,
              //                                   children: [
              //                                     Text(
              //                                       "ยารักษาโรคติดเชื้อแบคทีเรีย",
              //                                       style: TextStyle(
              //                                         color:
              //                                             Color.fromARGB(255, 51, 51, 51),
              //                                       ),
              //                                     ),
              //                                     SvgPicture.asset('assets/images/x.svg')
              //                                   ],
              //                                 ),
              //                                 SizedBox(
              //                                   height: 40,
              //                                 ),
              //                                 Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.spaceBetween,
              //                                   children: [
              //                                     Text(
              //                                       "฿ 1,300",
              //                                       style: TextStyle(
              //                                           color: Palette.kToDark,
              //                                           fontSize: 20),
              //                                     ),
              //                                     Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment.spaceBetween,
              //                                       children: [
              //                                         Row(
              //                                           children: [
              //                                             Container(
              //                                               width: 35,
              //                                               height: 35,
              //                                               decoration: BoxDecoration(
              //                                                   border: Border.all(
              //                                                       color: Color.fromARGB(
              //                                                           255,
              //                                                           130,
              //                                                           130,
              //                                                           130)),
              //                                                   borderRadius:
              //                                                       BorderRadius.all(
              //                                                           Radius.circular(
              //                                                               10))),
              //                                               child: InkWell(
              //                                                   onTap: () {
              //                                                     _minus();
              //                                                   },
              //                                                   child: Padding(
              //                                                     padding:
              //                                                         const EdgeInsets.all(
              //                                                             8.0),
              //                                                     child: SvgPicture.asset(
              //                                                       'assets/images/minus.svg',
              //                                                       width: 20,
              //                                                     ),
              //                                                   )),
              //                                             ),
              //                                             SizedBox(
              //                                               width: 5,
              //                                             ),
              //                                             SizedBox(
              //                                               width: 30,
              //                                               child: Padding(
              //                                                 padding:
              //                                                     const EdgeInsets.all(8.0),
              //                                                 child: Text(
              //                                                   "${_counter}",
              //                                                   textAlign: TextAlign.center,
              //                                                   style: TextStyle(
              //                                                       fontWeight:
              //                                                           FontWeight.bold),
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                             SizedBox(
              //                                               width: 5,
              //                                             ),
              //                                             Container(
              //                                               width: 35,
              //                                               height: 35,
              //                                               decoration: BoxDecoration(
              //                                                   border: Border.all(
              //                                                       color: Color.fromARGB(
              //                                                           255,
              //                                                           130,
              //                                                           130,
              //                                                           130)),
              //                                                   borderRadius:
              //                                                       BorderRadius.all(
              //                                                           Radius.circular(
              //                                                               10))),
              //                                               child: InkWell(
              //                                                   onTap: () {
              //                                                     _pluss();
              //                                                   },
              //                                                   child: Padding(
              //                                                     padding:
              //                                                         const EdgeInsets.all(
              //                                                             8.0),
              //                                                     child: SvgPicture.asset(
              //                                                       'assets/images/pluss.svg',
              //                                                       width: 20,
              //                                                       height: 20,
              //                                                     ),
              //                                                   )),
              //                                             ),
              //                                           ],
              //                                         )
              //                                       ],
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
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
}

void doNothing(BuildContext context) {}
