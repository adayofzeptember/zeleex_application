import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../Plate.dart';

class Facebook extends StatefulWidget {
  Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test facebook login"),
      ),
      body: Container(
        child: _isLoggedIn
            ? Column(
                children: [
                  Image.network(_userObj["picture"]["data"]["url"]),
                  Text(_userObj["email"]),
                  Text(_userObj["name"]),
                  TextButton(
                      onPressed: () {
                        FacebookAuth.instance.logOut().then((value) {
                          setState(() {
                            _isLoggedIn = false;
                            _userObj = {};
                          });
                        });
                      },
                      child: Text("ออกจากระบบ"))
                ],
              )
            : Center(
                child: ElevatedButton(
                  child: Text("เข้าสู่ระบบ"),
                  onPressed: () async {
                    FacebookAuth.instance.login(
                        permissions: ["public_profile", "email"]).then((value) {
                      FacebookAuth.instance.getUserData().then((userData) {
                        setState(() {
                          _isLoggedIn = true;
                          _userObj = userData;
                        });
                      });
                    });
                  },
                ),
              ),
      ),
    );
  }
}
