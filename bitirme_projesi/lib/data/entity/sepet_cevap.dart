import 'package:bitirme_projesi/data/entity/sepet.dart';

class SepetCevap {
  List<Sepet> sepet_yemekler;
  int success;
  SepetCevap({
    required this.sepet_yemekler,
    required this.success,
  });

  factory SepetCevap.fromJson(Map<String, dynamic> json) {
    int success = json["success"] as int;
    var jsonArray = json["sepet_yemekler"] as List;
    List<Sepet> sepet_yemekler = jsonArray.map((e) => Sepet.fromJson(e)).toList();

    return SepetCevap(sepet_yemekler: sepet_yemekler, success: success);
  }
}
