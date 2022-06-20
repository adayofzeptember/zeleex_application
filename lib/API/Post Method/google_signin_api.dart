
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../../payment_confirm.dart';
import '../../register.dart';

class GoogoleSignInApi {
  static final _googleSignIn555 = GoogleSignIn();
  static Future<GoogleSignInAccount?> google_SignIn() => _googleSignIn555.signIn();
  static Future<GoogleSignInAccount?> google_SignIn2() => _googleSignIn555.signIn();
  static Future google_LogOut() => _googleSignIn555.disconnect();
}

