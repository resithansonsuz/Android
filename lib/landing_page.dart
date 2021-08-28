import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teslimatinbende/home_page.dart';
import 'package:teslimatinbende/sign_in_page.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _controluser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage((user) {
        _updateUser(user);
      }, auth);
    } else {
      return HomePage(_user, () {
        _updateUser(null);
      },auth);
    }
  }

  void _controluser() {
    _user = auth.currentUser;
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }
}







