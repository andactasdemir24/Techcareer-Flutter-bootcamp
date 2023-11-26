// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class KisilerDaoRepository {
  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var yeniKisi = HashMap<String, dynamic>();
    yeniKisi["kisi_id"] = "";
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;

    collectionKisiler.add(yeniKisi);
  }

  Future<void> guncelle(String kisi_Id, String kisi_Ad, String kisi_Tel) async {
    var guncellenenKisi = HashMap<String, dynamic>();
    guncellenenKisi["kisi_ad"] = kisi_Ad;
    guncellenenKisi["kisi_tel"] = kisi_Tel;

    collectionKisiler.doc(kisi_Id).update(guncellenenKisi);
  }

  Future<void> sil(String kisi_id) async {
    collectionKisiler.doc(kisi_id).delete();
  }
}
