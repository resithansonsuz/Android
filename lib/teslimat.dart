import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teslimat extends StatelessWidget {
  final User user;
  final String id;
  final String gonderici;
  final String telefon;
  final String alisNoktasi;
  final String esyaBilgisi;
  final String varisNoktasi;
  final int ucreti;
  final int taminiSure;
  final int AlButonu;

  Teslimat(
      this.user,
      this.id,
      this.gonderici,
      this.telefon,
      this.alisNoktasi,
      this.esyaBilgisi,
      this.varisNoktasi,
      this.ucreti,
      this.taminiSure,
      this.AlButonu);

  void teslimatAl() async {
    await FirebaseFirestore.instance
        .collection("teslimatlar")
        .doc(id)
        .update({"Operator": user.displayName});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gönderici: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                gonderici,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Alış Noktası: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                alisNoktasi,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Varış Noktası: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                varisNoktasi,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tahmini Süre: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "$taminiSure",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ücreti: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "$ucreti",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Eşya Bilgisi: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                esyaBilgisi,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Telefon: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                telefon,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          (AlButonu == 1)
              ? RaisedButton(
                  onPressed: teslimatAl,
                  child: Text("Al"),
                )
              : SizedBox(
                  height: 0,
                )
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green.withOpacity(0.6), Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
