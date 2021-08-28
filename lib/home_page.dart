import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teslimatinbende/TeslimAldiklarim.dart';
import 'package:teslimatinbende/TeslimatiVer.dart';
import 'package:teslimatinbende/Teslimatlarim.dart';
import 'TeslimatAl.dart';
import 'landing_page.dart';

class HomePage extends StatelessWidget {
  final User user;
  final VoidCallback signOut;
  final FirebaseAuth auth;

  HomePage(this.user, this.signOut, this.auth);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () => _cikisYap(context),
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.black87),
            ),
          )
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
          child: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.lightGreen,
            ),
          ),
          Center(
            child: Image.asset('imagess/Hizmetler-Hizli-Teslimat.png'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(
                    "Teslimat Al",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TeslimatAl.routeName,
                        arguments: {"user": user, "auth": auth});
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  child: Text(
                    "Teslimatı Ver",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TeslimatiVer.routeName,
                        arguments: {"user": user, "auth": auth});
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  child: Text(
                    "Teslimatlarım",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Teslimatlarim.routeName,
                        arguments: {"user": user, "auth": auth});
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  child: Text(
                    "Teslim Aldıklarım",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TeslimAldiklarim.routeName,
                        arguments: {"user": user, "auth": auth});
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final googleUser = GoogleSignIn();
    await googleUser.signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LandingPage(),
      ),
    );
  }
}
