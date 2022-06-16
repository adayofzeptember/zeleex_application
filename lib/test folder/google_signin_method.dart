import 'package:google_sign_in/google_sign_in.dart';

class GoogoleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> google_SignIn() =>
      _googleSignIn.signIn().then((result) {
        result!.authentication.then((googleKey) {
          print(googleKey.accessToken);
          print(googleKey.idToken);
          print(_googleSignIn.currentUser!.displayName);
        }).catchError((err) {
          print('inner error');
        });
      }).catchError((err) {
        print('error occured');
      });
  static Future google_LogOut() => _googleSignIn.disconnect();
}

Future google_Login() async {
  final userGoogle = await GoogoleSignInApi.google_SignIn();
  print("------------------------------------------------------------------");
  print(userGoogle!.id);
  print(userGoogle.email);
  print(userGoogle.displayName);
}
