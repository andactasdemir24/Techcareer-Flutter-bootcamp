import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/data/entity/sepet_cevap.dart';
import 'package:dio/dio.dart';

class SepetDaoRepository {
  List<Sepet> parseSepetCevap(String cevap) {
    try {
      if (cevap.isNotEmpty) {
        return SepetCevap.fromJson(json.decode(cevap)).sepet_yemekler;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> sepeteEkleGuncelle(
      String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var mevcutSepet = await sepetiYukle(kullanici_adi);
    Sepet? mevcutUrun = mevcutSepet.firstWhereOrNull((urun) => urun.yemek_adi == yemek_adi);

    if (mevcutUrun != null) {
      await urunSil(mevcutUrun.sepet_yemek_id, kullanici_adi);
      yemek_siparis_adet += mevcutUrun.yemek_siparis_adet;
    }

    var url = 'http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php';
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };
    await Dio().post(url, data: FormData.fromMap(veri));
  }

  Future<List<Sepet>> sepetiYukle(String kullanici_adi) async {
    var url = 'http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php';
    var veri = {
      "kullanici_adi": kullanici_adi,
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseSepetCevap(cevap.data);
  }

  Future<void> urunSil(int sepet_yemek_id, String kullanici_adi) async {
    var url = 'http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php';
    var veri = {"sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullanici_adi};
    await Dio().post(url, data: FormData.fromMap(veri));
  }

  Future<void> urunAdetAzaltVeGerekirseSil(int sepetYemekId, String kullaniciAdi) async {
    var mevcutSepet = await sepetiYukle(kullaniciAdi);
    var urun = mevcutSepet.firstWhereOrNull((u) => u.sepet_yemek_id == sepetYemekId);

    if (urun != null && urun.yemek_siparis_adet > 1) {
      var url = 'http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php';
      var veri = {
        "yemek_adi": urun.yemek_adi,
        "yemek_resim_adi": urun.yemek_resim_adi,
        "yemek_fiyat": urun.yemek_fiyat,
        "yemek_siparis_adet": urun.yemek_siparis_adet - 1,
        "kullanici_adi": urun.kullanici_adi
      };
      await Dio().post(url, data: FormData.fromMap(veri));
      await urunSil(sepetYemekId, kullaniciAdi);
    } else if (urun != null) {
      await urunSil(sepetYemekId, kullaniciAdi);
    }
    sepetiYukle(kullaniciAdi);
  }
}
