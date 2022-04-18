import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Plate.dart';
import 'package:http/http.dart' as Http;
import 'newAPI_service.dart';

void main(List<String> args) {
  runApp(ApiTest());
}

class ApiTest extends StatelessWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Palette.kToDark),
        ),
        home: Api_widget());
  }
}

class Api_widget extends StatefulWidget {
  Api_widget({Key? key}) : super(key: key);

  @override
  State<Api_widget> createState() => _Api_widgetState();
}

class _Api_widgetState extends State<Api_widget> {
  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Palette.kToDark,
        ),
        backgroundColor: Palette.kToDark,
        title: Text(
          "on API",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: NewAPI_TEST.randomDog(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    NewAPI msg = snapshot.data;
                    // print("snap = " + msg.mess);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(msg.address!.geo!.lat.toString()),
                      
                      Text(msg.company!.name!.toString())],
                    );
                    // return Image.network(
                    //   msg.mess,
                    //   width: 300,
                    //   height: 200,
                    // );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
