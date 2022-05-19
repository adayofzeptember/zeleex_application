import 'dart:html';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import 'package:zeleex_application/second.dart';
import 'package:zeleex_application/test%20folder/device_info.dart';

void main() {
  runApp(const First_Page());
}

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.kToDark,
        appBarTheme: AppBarTheme(color: Palette.kToDark),
      ),
      home: main_Icon(),
    );
  }
}

class main_Icon extends StatefulWidget {
  main_Icon({Key? key}) : super(key: key);
  @override
  State<main_Icon> createState() => _main_IconState();
}

class _main_IconState extends State<main_Icon> {
  String choice = "";
  int tag = 0;
  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ChipsChoice<int>.single(
              value: tag,
              onChanged: (val) => setState(() {
                tag = val;
                // print(val);
                // print(tag);
                choice = options[val].toString();
                print(choice);
              }),
              choiceStyle: C2ChoiceStyle(color: Palette.kToDark
              
              ),
              choiceItems: C2Choice.listFrom<int, String>(
                source: options,
                value: (i, v) => i,
                label: (i, v) => v,
              ),
            )
          ],
        ),
      ),
    );
  }
}
