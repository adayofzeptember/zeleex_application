import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:zeleex_application/from%20Profile/wait_payment_widget.dart';
import 'package:zeleex_application/profile.dart';
import '../Plate.dart';
import 'package:flutter/services.dart';



class BuyingListPage extends StatefulWidget {
  BuyingListPage({Key? key}) : super(key: key);

  @override
  State<BuyingListPage> createState() => _BuyingListPageState();
}

class _BuyingListPageState extends State<BuyingListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
       
          appBar: AppBar(
            
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark,

          ),
            automaticallyImplyLeading: false,
            backgroundColor: Palette.kToDark,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                       Navigator.pop(context);
                    // Navigator.of(context, rootNavigator: true).pop(context);
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
