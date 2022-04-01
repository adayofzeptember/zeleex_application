import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Plate.dart';
import 'payment.dart';

void main(List<String> args) {
  runApp(PaymentConfirmPage());
}

class PaymentConfirmPage extends StatelessWidget {
  const PaymentConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentConfirm_widget(),
    );
  }
}

class PaymentConfirm_widget extends StatefulWidget {
  PaymentConfirm_widget({Key? key}) : super(key: key);

  @override
  State<PaymentConfirm_widget> createState() => _PaymentConfirm_widgetState();
}

class _PaymentConfirm_widgetState extends State<PaymentConfirm_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
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
                "ยืนยันการชำระเงิน",
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
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "รวมการสั่งซื้อ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("฿1,335",
                        style: TextStyle(
                            color: Palette.kToDark,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 230, 230, 230)))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "วิธีการชำระเงิน",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("ธนาคารกสิกรไทย (*3446)",
                        style: TextStyle(
                          color: Color.fromARGB(255, 130, 130, 130),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
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
                          side: BorderSide(color: Palette.kToDark),
                          primary: Palette.kToDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          child: Text(
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
      ),
    );
  }
}