import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeleex_application/testApi/GetDogApi.dart';
import 'package:zeleex_application/testApi/apiService.dart';
import '../Plate.dart';
import 'package:http/http.dart' as Http;

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
  @override
  void initState() {
    super.initState();
    // DogService.randomDog();
  }

// //ก้องรัก
//   GetDogs? _datafromAPI;
//   Future<void> getAnimals() async {
//     print("โชว์สัตว์");
//     var url = "https://dog.ceo/api/breeds/image/random";
//     var resPonse = await Http.get(Uri.parse(url));
//     //print(resPonse.body);
//     setState(() {
//       _datafromAPI = getDogsFromJson(resPonse.body);
//     });
//   }

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
            // Text(_datafromAPI!.message??="waitng"),
//           FutureBuilder(future: getAnimals(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
//             if(snapshot.connectionState == ConnectionState.done){
//               return Text("data");
//             }
//             else{
//               return Text("no dfata");
//             }
//           })

// ,
            FutureBuilder(
                future: DogService.randomDog(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    MessageTell msg = snapshot.data;
                    // print("snap = " + msg.mess);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("${msg.mess}")
                      ],
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
