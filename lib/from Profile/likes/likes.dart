import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:zeleex_application/from%20Profile/likes/likes_product_widget.dart';
import 'package:zeleex_application/from%20Profile/wait_payment_widget.dart';
import 'package:zeleex_application/from%20Profile/profile.dart';
import 'package:flutter/services.dart';
import '../../Others/Plate.dart';

class LikesPage extends StatefulWidget {
  LikesPage({Key? key}) : super(key: key);

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: ZeleexColor.zeleexGreen),
            automaticallyImplyLeading: false,
            backgroundColor: ZeleexColor.zeleexGreen,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "สิ่งที่ถูกใจ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            bottom: TabBar(
                labelColor: ZeleexColor.zeleexGreen,
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
                      child: Text("สัตว์"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("สินค้า"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("น้ำเชื้อ"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Text("wait for data"),
            ),
            LikesProduct(),
            Center(
              child: Text("wait for data"),
            )
          ]),
        ));
  }
}
