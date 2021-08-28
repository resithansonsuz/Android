import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teslimatinbende/social_login_button.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = "/signin";
  final Function(User) onSignIn;
  final FirebaseAuth auth;

  SignInPage(this.onSignIn, this.auth);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  _googleIleGiris(BuildContext context) async {
    GoogleSignIn googleSignIn = new GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        UserCredential result = await widget.auth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        widget.onSignIn(result.user);
      }
    }
  }

  _facebookIleGiris(BuildContext context) async {
    final facebookLogin = new FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn();
    switch (result.status) {
      case (FacebookLoginStatus.success):
        if (result.accessToken != null) {
          UserCredential userResult = await widget.auth.signInWithCredential(
              FacebookAuthProvider.credential(result.accessToken.token));
          widget.onSignIn(userResult.user);
        }
        break;
      case (FacebookLoginStatus.cancel):
        debugPrint("iptal edildi");
        break;
      case (FacebookLoginStatus.error):
        debugPrint("hatalı giriş");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TeslimatınBende",
        ),
        centerTitle: true,
        elevation: 10,
      ),

      backgroundColor: Colors.grey.shade300,
      body: Container(

        color: Colors.lightGreen.shade300,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
             Center(child: Image.asset('imagess/teslimat.png')),
            Text(
              "Oturum Açınız",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // ignore: deprecated_member_use
            SocialLoginButton(
              butonText: "Gmail ile giriş yapınız",
              TextColor: Colors.black87,
              butonIcon: Image.asset("imagess/gmaill.png"),
              radius: 16,
              onPressed: () => _googleIleGiris(context),
              butonColor: Colors.white,
            ),
           /* SocialLoginButton(
              butonText: "Facebook ile giriş yapınız",
              TextColor: Colors.white,
              butonIcon: Image.asset("imagess/Facebook_icon.svg.png"),
              radius: 16,
              onPressed: () => _facebookIleGiris(context),
              butonColor: Color(0xff334d92),
            ),*/
          ],
        ),
      ),
    );
  }
}
