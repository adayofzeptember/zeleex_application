import 'package:google_sign_in/google_sign_in.dart';

class GoogoleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> google_SignIn() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> google_SignIn2() =>
      _googleSignIn.signIn();

  static Future google_LogOut() => _googleSignIn.disconnect();
}

Future google_Login() async {
  final userGoogle = await GoogoleSignInApi.google_SignIn();
  print("--------------------------------------------------------------------------------");
  print(userGoogle!.id);
  print(userGoogle.email);
  print(userGoogle.displayName);

  GoogoleSignInApi.google_SignIn2().then((result) {
    result!.authentication.then((googleKey) {
      print("access token: " + googleKey.accessToken.toString());
      print("id token: " + googleKey.idToken.toString());
      print(userGoogle.email);
    }).catchError((err) {
      print('error in');
    });
  }).catchError((err) {
    print('error out');
  });
}
