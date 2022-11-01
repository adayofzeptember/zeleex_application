import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Plate.dart';
import 'payment.dart';

class Payment_Method extends StatefulWidget {
  Payment_Method({Key? key}) : super(key: key);

  @override
  State<Payment_Method> createState() => _Payment_MethodState();
}

class _Payment_MethodState extends State<Payment_Method> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              "เลือกช่องทางการชำระเงิน",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "วิธีการชำระเงิน",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/testvisa.svg',
                              color: Palette.kToDark,
                              width: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ธนาคารกสิกรไทย (*3456)",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "บัตรเครดิต/เดบิต",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //  SvgPicture.asset(
                            //   'assets/images/visa.svg',
                            //   width: 40,
                            // ),
                            Image.asset('assets/images/visagroup.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 206, 206, 206),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/cash.svg',
                              width: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ชำระเงินปลายทาง",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "ชำระเงินเมื่อได้รับสินค้า",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 206, 206, 206),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/bank.svg',
                              width: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "โอนเงินผ่านธนาคาร",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "ชำระผ่านหมายเลขอ้างอิง",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/banks.svg',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 206, 206, 206),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/mobile.svg',
                              width: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "โมบายแบงก์กิ้ง",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "ชำระในแอปพลิเคชันธนาคาร",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/bankapp.png'),

                            // SvgPicture.asset(
                            //   'assets/images/banks.svg',
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 206, 206, 206),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
