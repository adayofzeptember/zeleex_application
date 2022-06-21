import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class XXX extends StatefulWidget {
  
  XXX({Key? key}) : super(key: key);

  @override
  State<XXX> createState() => _XXXState();
}

class _XXXState extends State<XXX> {
  String tokkl = '';
  @override
  void initState() {
    super.initState();
    loginh();
  }

  Future loginh() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('key');
    print("---------------------------------" + x.toString());
    setState(() {
      tokkl = x.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(tokkl),
      ),
    );
  }
}
