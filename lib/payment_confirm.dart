import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Others/Plate.dart';
import 'payment.dart';

class Payment_Confirm extends StatefulWidget {
  Payment_Confirm({Key? key}) : super(key: key);

  @override
  State<Payment_Confirm> createState() => _Payment_ConfirmState();
}

class _Payment_ConfirmState extends State<Payment_Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
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
              "ยืนยันการชำระเงิน",
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "รวมการสั่งซื้อ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("฿1,335",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border(
                    top:
                        BorderSide(color: Color.fromARGB(255, 230, 230, 230)))),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "วิธีการชำระเงิน",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("ธนาคารกสิกรไทย (*3446)",
                      style: TextStyle(
                        color: Color.fromARGB(255, 130, 130, 130),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: ZeleexColor.zeleexGreen),
                        primary: ZeleexColor.zeleexGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        child: const Text(
                          "ชำระเงิน",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
