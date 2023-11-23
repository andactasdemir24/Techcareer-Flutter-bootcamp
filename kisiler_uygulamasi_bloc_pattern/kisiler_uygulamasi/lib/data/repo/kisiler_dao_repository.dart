// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler_cevap.dart';

import '../entity/kisiler.dart';

class KisilerDaoRepository {
  List<Kisiler> parseKisierCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/insert_kisiler.php';
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kisi Ekle : ${cevap.data.toString()}");
  }

  Future<void> guncelle(int kisi_Id, String kisi_Ad, String kisi_Tel) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/update_kisiler.php';
    var veri = {"kisi_id": kisi_Id, "kisi_ad": kisi_Ad, "kisi_tel": kisi_Tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kisi Güncelle : ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler.php';
    var cevap = await Dio().get(url);
    return parseKisierCevap(cevap.data.toString());
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php';
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseKisierCevap(cevap.data.toString());
  }

  Future<void> sil(int kisi_id) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/delete_kisiler.php';
    var veri = {"kisi_id": kisi_id};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kisi sil : ${cevap.data.toString()}");
  }
}
