import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../../payment_confirm.dart';
import '../../register.dart';

class GoogoleSignInApi {
  static final _googleSignIn555 = GoogleSignIn();
  static Future<GoogleSignInAccount?> google_SignIn() =>
      _googleSignIn555.signIn();
  static Future<GoogleSignInAccount?> google_SignIn2() =>
      _googleSignIn555.signIn();
  static Future google_LogOut() => _googleSignIn555.disconnect();
}

  //  Future<dynamic> google_Login() async {
  //   final userGoogle = await GoogoleSignInApi.google_SignIn();
  //   print(
  //       "--------------------------------------------------------------------------------");

  //   GoogoleSignInApi.google_SignIn2().then((result) {
  //     result!.authentication.then((googleKey) {
  //       print("id token ----------------> " + googleKey.idToken.toString());
  //       print("access token ------------------> " +
  //           googleKey.accessToken.toString());
  //       print("gmail ------------------> " + userGoogle!.email.toString());
  //       print("name -------------------> " + userGoogle.displayName.toString());
  //       print("image ------------------> " + userGoogle.photoUrl.toString());

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => RegisterPage(user: userGoogle),
  //         ),
  //       );
  //     }).catchError((err) {
  //       print('error in');
  //     });
  //   }).catchError((err) {
  //     print('error out');
  //   });
  // }