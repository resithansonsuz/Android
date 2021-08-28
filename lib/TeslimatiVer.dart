import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeslimatiVer extends StatefulWidget {

  static const String routeName="/teslimati-ver";

  @override
  _TeslimatiVerState createState() => _TeslimatiVerState();
}

class _TeslimatiVerState extends State<TeslimatiVer> {
  User user;
  FirebaseAuth auth;
   String gonderici="";
   String telefon="";
   String alisNoktasi="";
   String esyaBilgisi="";
   String varisNoktasi="";
   int ucreti=0;
   int tahminiSure=0;

  void teslimatVer(BuildContext context)async{
    await FirebaseFirestore.instance.collection("teslimatlar").add({
      "gonderici": user.displayName,
      "alisNoktasi": alisNoktasi,
      "varisNoktasi": varisNoktasi,
      "telefon": telefon,
      "Operator": "",
      "esyaBilgisi": esyaBilgisi,
      "tahminiSure": tahminiSure,
      "ucreti": ucreti
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    user = args["user"];
    auth = args["auth"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Teslimat Ver"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Gönderici ",
                    labelText: "Ad,Soyad",
                    labelStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                      border: InputBorder.none,
                      fillColor:Colors.greenAccent,
                      filled:true,
                  ),
                      obscureText: false,
                    maxLines: 3,
                  onChanged: (YeniDeger){
                     gonderici = YeniDeger;

                  },

                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Telefon Numarası",
                    labelText: "Tel No",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                    telefon=YeniDeger;

                  },

                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Alınacak Adres",
                    labelText: "Konum",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                  alisNoktasi = YeniDeger;

                },


                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Eşya Bilgisi",
                    labelText: "Eşya Adı",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                    esyaBilgisi = YeniDeger;

                  },

                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Verilecek Adresi",
                    labelText: "Alıcı Konum",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                    varisNoktasi=YeniDeger;

                  },

                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Tahmini Ücret",
                    labelText: "Fiyat Aralığı",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,

                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                    ucreti=int.parse(YeniDeger);

                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Süre",
                    labelText: "Varış Süresi(Dakika)",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor:Colors.greenAccent,
                    filled:true,
                  ),
                  obscureText: false,
                  maxLines: 3,
                  onChanged: (YeniDeger){
                    tahminiSure=int.parse(YeniDeger);

                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  highlightColor: Colors.red,
                  elevation: 10,
                  child: Text(
                    "Kaydet",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed:
                  ()=>
                    teslimatVer(context),
                ),
              ],
            )
        ),
      ),
    );
  }
}


