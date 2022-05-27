import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikesProduct extends StatefulWidget {
  LikesProduct({Key? key}) : super(key: key);

  @override
  State<LikesProduct> createState() => _LikesProductState();
}

class _LikesProductState extends State<LikesProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                                    'assets/images/image21.png',
                                    fit: BoxFit.fill,
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                child: Container(
                                  height: 40,
                                  child: Text(
                                    "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 51, 51, 51),
                                    ),
                                  ),
                                ),
                              ),
                               Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "฿ 1,090",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SvgPicture.asset('assets/images/red_heart.svg')
                                    ],
                                  )
                                  ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 10,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
               'assets/images/image21.png',                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                child: Container(
                                  height: 40,
                                  child: Text(
                                    "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 51, 51, 51),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "฿ 890",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SvgPicture.asset('assets/images/red_heart.svg')
                                    ],
                                  )
                                  ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
               'assets/images/image21.png',                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                child: Container(
                                  height: 40,
                                  child: Text(
                                    "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 51, 51, 51),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "฿ 750",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SvgPicture.asset('assets/images/red_heart.svg')
                                    ],
                                  )
                                  ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 10,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: Image.asset(
                          'assets/images/image21.png',
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                child: Container(
                                  height: 40,
                                  child: Text(
                                    "อาหารลูกโค ซีพี 973 จีเอ็มขนาด 10 กิโลกรัม สำหรับลูกโคแรกเกิด",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 51, 51, 51),
                                    ),
                                  ),
                                ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "฿ 1,500",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SvgPicture.asset('assets/images/red_heart.svg')
                                    ],
                                  )
                                  ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
