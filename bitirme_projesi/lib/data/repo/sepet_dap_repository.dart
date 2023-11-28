import 'dart:convert';

import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/data/entity/sepet_cevap.dart';
import 'package:dio/dio.dart';

class SepetDaoRepository {
  List<Sepet> parseSepetCevap(String cevap) {
    return SepetCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<void> sepeteEkle(
      String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = 'http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php';
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sepete Ekle : ${cevap.data.toString()}");
  }

  Future<List<Sepet>> sepetiYukle(String kullanici_adi) async {
    var url = 'http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php';
    var veri = {
      "kullanici_adi": kullanici_adi,
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sepete Getir : ${cevap.data.toString()}");
    return parseSepetCevap(cevap.data);
  }
}