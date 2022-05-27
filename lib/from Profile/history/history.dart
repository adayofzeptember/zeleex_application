import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../Plate.dart';
import 'history_success.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: Palette.kToDark),
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
                  "ประวัติการสั่งซื้อ",
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
                      child: Text("สั่งซื้อสำเร็จ"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ยกเลิกสินค้า"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("คืนสินค้า/คืนเงิน"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              History_Success(),
              Center(
                  child: Container(
                child: Text("wait for Data"),
              )),
              Center(
                  child: Container(
                child: Text("wait for Data"),
              )),
            ],
          ),
        ));
  }
}

void doNothing(BuildContext context) {}
