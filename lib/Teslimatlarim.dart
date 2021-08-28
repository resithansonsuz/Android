import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'teslimat.dart';

class Teslimatlarim extends StatefulWidget {

  static const String routeName="/teslimatlarim";

  @override
  _TeslimatlarimState createState() => _TeslimatlarimState();
}

class _TeslimatlarimState extends State<Teslimatlarim> {
  User user;
  FirebaseAuth auth;
  List<Map<String, dynamic>> datas = [];
  List<String> ids = [];

  Stream<QuerySnapshot> verileriGetir(){
    return FirebaseFirestore.instance.collection("teslimatlar").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    user = args["user"];
    auth = args["auth"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Teslimatlarım"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: verileriGetir(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            snapshot.data.docs.forEach((element) {
              if (element.data()["gonderici"]==user.displayName) {
                ids.add(element.id);
                datas.add(element.data());
               }
            });
          }else{
            return Center(
              child:Text("Hiçbir Teslimat Bulunamadı!!") ,
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Teslimat(
                user,
                  ids[index],
                  datas[index]["gonderici"],
                  datas[index]["telefon"],
                  datas[index]["alisNoktasi"],
                  datas[index]["esyaBilgisi"],
                  datas[index]["varisNoktasi"],
                  datas[index]["ucreti"],
                  datas[index]["tahminiSure"],0
              );
            },
            itemCount: datas.length,
          );
        },
      )
    );
  }
}


