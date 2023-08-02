import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Others/Plate.dart';

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
        systemOverlayStyle: const SystemUiOverlayStyle(
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
              "เลือกช่องทางการชำระเงิน",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "วิธีการชำระเงิน",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/testvisa.svg',
                              color: ZeleexColor.zeleexGreen,
                              width: 40,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                const Text(
                                  "ธนาคารกสิกรไทย (*3456)",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
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
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/cash.svg',
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "ชำระเงินปลายทาง",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "ชำระเงินเมื่อได้รับสินค้า",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
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
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/bank.svg',
                              width: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "โอนเงินผ่านธนาคาร",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
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
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 206, 206))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/mobile.svg',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "โมบายแบงก์กิ้ง",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
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
