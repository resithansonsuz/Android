import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teslimatinbende/TeslimAldiklarim.dart';
import 'package:teslimatinbende/TeslimatiVer.dart';
import 'package:teslimatinbende/Teslimatlarim.dart';
import 'package:teslimatinbende/landing_page.dart';

import 'TeslimatAl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeslimatinBende',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),

      initialRoute: "/",

      routes: {

    "/":(context) => LandingPage(),
        TeslimatiVer.routeName:(context) => TeslimatiVer(),
        TeslimatAl.routeName:(context) => TeslimatAl(),
        TeslimAldiklarim.routeName:(context) => TeslimAldiklarim(),
        Teslimatlarim.routeName:(context) => Teslimatlarim(),
    },
    );
  }

}
