import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/API/testApi/list_nested_API.dart';
import 'package:zeleex_application/Plate.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<User>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchData123();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.kToDark,
        appBarTheme: AppBarTheme(color: Palette.kToDark),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark,
          ),
          backgroundColor: Palette.kToDark,
          title: Center(
            child: Text(
              "List and Nested API",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: FutureBuilder<List<User>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(data![index].address!.geo!.lat.toString()),
                          Text(data[index].name.toString()),
                          SizedBox(height: 10,)
                        ],
                      ),
                      
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
