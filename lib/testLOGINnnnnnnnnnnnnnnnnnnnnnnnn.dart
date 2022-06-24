
import 'package:google_sign_in/google_sign_in.dart';


Future signIn() async{
await GoogleSignInApi.login();
}

Future signOut() async{
await GoogleSignInApi.logout();
}

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
    static Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();
}