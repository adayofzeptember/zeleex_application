import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/payment_confirm.dart';
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
  List<bool> isSelected = [true, false];
  // bool status = false;
  // int myVar = 1;
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
                "????????????????????????",
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment_Address(),
                            ),
                          );
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
                                        "?????????????????????????????????????????????????????????",
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
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "?????????????????? ???????????????????????????????????????",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "086-366-3928",
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      child: Container(
                                        width: 250,
                                        child: Text(
                                            "369/11 ????????????????????? ????????? 6 ????????????????????????????????? ?????????????????????????????? ??????????????????????????????????????????????????? 30000"),
                                      ))
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                        "?????????????????????????????????????????????????????????????????????????????????",
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
                                        "??? 1,300",
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
                                                    "???????????????: 1",
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
                                          "?????????????????????????????????????????????????????????????????????",
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
                                              '????????????',
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
                                              '????????????????????????',
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
                                        "????????????????????????????????????????????????????????????????????????",
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
                                          "????????????????????????????????????",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text("???35.00",
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
                                          "?????????????????????????????????????????????????????????????????? 23 ??????.???.",
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
                              "??????????????????????????????????????????????????? (??????????????? 1): ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "???1,990",
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
                            "???????????????????????????????????????????????????",
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
                            child: Text(
                              "??????????????????????????????????????????????????????????????????????????? >",
                              style: TextStyle(
                                  color: Palette.kToDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       children: <Widget>[
                      //         ToggleButtons(
                      //           color: Colors.grey,
                      //           borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(10),
                      //               bottomLeft: Radius.circular(10),
                      //               topRight: Radius.circular(10),
                      //               bottomRight: Radius.circular(10)),
                      //           children: <Widget>[
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       color: Color.fromARGB(
                      //                           255, 227, 228, 227))),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(10.0),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         SvgPicture.asset(
                      //                           'assets/images/cash.svg',
                      //                         ),
                      //                         VerticalDivider(
                      //                           width: 5,
                      //                         ),
                      //                         Text(
                      //                           "?????????????????????????????????????????? (*3446)",
                      //                           style: TextStyle(
                      //                               color: Color.fromARGB(
                      //                                   255, 130, 130, 130),
                      //                               fontWeight:
                      //                                   FontWeight.bold),
                      //                         )
                      //                       ],
                      //                     ),
                      //                     SizedBox(
                      //                       height: 20,
                      //                     ),
                      //                     Text("??????????????????????????????/???????????????",
                      //                         style: TextStyle(
                      //                             color: Color.fromARGB(
                      //                                 255, 130, 130, 130)))
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   //
                      //                   border: Border.all(
                      //                       color: Color.fromARGB(
                      //                           255, 227, 228, 227))),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(10.0),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         SvgPicture.asset(
                      //                           'assets/images/cash.svg',
                      //                         ),
                      //                         VerticalDivider(
                      //                           width: 5,
                      //                         ),
                      //                         Text(
                      //                           "?????????????????????????????????????????????",
                      //                           style: TextStyle(
                      //                               color: Color.fromARGB(
                      //                                   255, 130, 130, 130),
                      //                               fontWeight:
                      //                                   FontWeight.bold),
                      //                         )
                      //                       ],
                      //                     ),
                      //                     SizedBox(
                      //                       height: 20,
                      //                     ),
                      //                     Text("???????????????????????????????????????????????????????????????????????????",
                      //                         style: TextStyle(
                      //                             color: Color.fromARGB(
                      //                                 255, 130, 130, 130)))
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //           onPressed: switchClick,
                      //           isSelected: isSelected,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                                        "?????????????????????????????????????????? (*3446)",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("??????????????????????????????/???????????????",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)))
                                ],
                              ),
                            ),
                          )),
                          VerticalDivider(width: 5.0),
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
                                        "?????????????????????????????????????????????",
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
                                  Text("???????????????????????????????????????????????????????????????????????????",
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
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200]),
                              width: double.infinity,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '????????????????????????????????????????????????????????????',
                                  // // prefixIcon: ImageIcon(
                                  // //   AssetImage(
                                  // //     "assets/images/new/cupon.png",
                                  // //   ),
                                  // ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                        'assets/images/ticket.svg',
                                        color: Colors.grey),
                                  ),

                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 214, 214, 214)),
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
                              ))),
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
                                          "??????????????????????????????????????????????????????????????????????????????",
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
                                              '*??????????????????????????????????????????????????????????????????????????????',
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
                                                hintText: '?????????????????????????????????',
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
                                              '??????????????????????????????????????????????????????????????????',
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
                                                    '??????????????????????????????????????????????????????????????????????????????',
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
                                              '????????????????????????????????????/???????????????????????? (????????????????????????????????????)',
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
                                                    '??????????????????????????????????????????????????????????????????/???????????????????????? ????????????????????????????????????',
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
                                                "??????????????????",
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
                          "??????????????????????????????????????????",
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
                                  "??????????????????????????????????????????",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "???1,300",
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
                                  "????????????????????????????????????",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "???45",
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
                                  "??????????????????????????????????????????????????????",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "???1,345",
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
                                      Text("??????????????????????????????",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51))),
                                      Text(
                                        "??? 1,990",
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
                                  "????????????????????????",
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
