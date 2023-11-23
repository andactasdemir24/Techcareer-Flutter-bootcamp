// ignore_for_file: non_constant_identifier_names

import 'package:kisiler_uygulamasi/sqlite/veritabani_yardimcisi.dart';

import '../entity/kisiler.dart';

class KisilerDaoRepository {
  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var yeniKisi = <String, dynamic>{};
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;

    await db.insert("Kisiler", yeniKisi);
  }

  Future<void> guncelle(int kisi_Id, String kisi_Ad, String kisi_Tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncellenenKisi = <String, dynamic>{};
    guncellenenKisi["kisi_ad"] = kisi_Ad;
    guncellenenKisi["kisi_tel"] = kisi_Tel;

    await db.update("Kisiler", guncellenenKisi, where: "kisi_id = ?", whereArgs: [kisi_Id]);
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM kisiler");
    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var kisi_id = satir["kisi_id"];
      var kisi_ad = satir["kisi_ad"];
      var kisi_tel = satir["kisi_tel"];

      return Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel);
    });
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%%$aramaKelimesi'");
    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var kisi_id = satir["kisi_id"];
      var kisi_ad = satir["kisi_ad"];
      var kisi_tel = satir["kisi_tel"];

      return Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel);
    });
  }

  Future<void> sil(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("Kisiler", where: "kisi_id = ?", whereArgs: [kisi_id]);
  }
}
