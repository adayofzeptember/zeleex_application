import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:zeleex_application/from%20Profile/wait_payment.dart';
import '../Plate.dart';
import 'package:flutter/services.dart';

class BuyingList extends StatelessWidget {
  const BuyingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.kToDark,
        appBarTheme: AppBarTheme(color: Palette.kToDark),
      ),
      home: BuyingList_widget(),
    );
  }
}

class BuyingList_widget extends StatefulWidget {
  BuyingList_widget({Key? key}) : super(key: key);

  @override
  State<BuyingList_widget> createState() => _BuyingList_widgetState();
}

class _BuyingList_widgetState extends State<BuyingList_widget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.kToDark,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "รายการสั่งซื้อ",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.abc_sharp,
                  color: Palette.kToDark,
                )
              ],
            ),
            bottom: TabBar(
                labelColor: Palette.kToDark,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("รอการชำระเงิน"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("เตรียมจัดส่ง"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ระหว่างการขนส่ง"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Wait_Payment(),
            Icon(Icons.movie),
            Icon(Icons.games),
          ]),
        ));
  }
}
