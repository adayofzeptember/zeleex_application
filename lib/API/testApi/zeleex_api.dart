// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:zeleex_application/API/zeleex_api_model.dart';

// import '../Plate.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<List<Data2>> futureData;
//   @override
//   void initState() {
//     super.initState();
//     futureData = fetch_HelpCenter();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Kanit',
//         primarySwatch: Palette.kToDark,
//         appBarTheme: AppBarTheme(color: Palette.kToDark),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarIconBrightness: Brightness.light,
//             statusBarBrightness: Brightness.light,
//             statusBarColor: Palette.kToDark,
//           ),
//           backgroundColor: Palette.kToDark,
//           title: Text(
//             "on API ",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Column(
//           children: <Widget>[
//             FutureBuilder<List<Data2>>(
//               future: futureData,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   List<Data2>? data = snapshot.data;
//                   return Expanded(
//                     child: ListView.builder(
//                         itemCount: 5,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             child:   InkWell(
//                     onTap: () {},
//                     child: Container(
//                         width: double.infinity,
//                         padding: EdgeInsets.all(20.0),
//                         decoration: BoxDecoration(
//                             // border: Border.all(
//                             //     color: Color.fromARGB(255, 233, 233, 233))
//                             border: Border(
//                           top: BorderSide(color: Color.fromARGB(255, 245, 245, 245)),
//                         )),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               data![index].title.toString(),
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 130, 130, 130),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Color.fromARGB(255, 130, 130, 130),
//                             )
//                           ],
//                         )),
//                                   ),
//                           );
//                         }),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text("${snapshot.error}");
//                 }
//                 // By default show a loading spinner.
//                 return CircularProgressIndicator();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
