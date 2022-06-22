import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Plate.dart';

class Test_afterLogin extends StatefulWidget {
  Test_afterLogin({Key? key}) : super(key: key);

  @override
  State<Test_afterLogin> createState() => _Test_afterLoginState();
}

class _Test_afterLoginState extends State<Test_afterLogin> {
  String token = '';
  String email = '';
  String id = '';

  @override
  void initState() {
    super.initState();
    afterLogin();
  }

  Future afterLogin() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var gotToken = prefs2.get('keyToken');
    var gotMail = prefs2.get('keyEmail');
    var gotID = prefs2.get('keyID');
    setState(() {
      id = gotID.toString();
      token = gotToken.toString();
      email = gotMail.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: Palette.kToDark),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Center(
                child: Text(
              'logged',
              style: TextStyle(color: Colors.white),
            )),
          ),
          backgroundColor: Palette.kToDark,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id,
            ),
            Text(email),
            Text(token)
          ],
        ));
  }
}
