// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'yemekler.dart';

class YemeklerCevap {
  List<Yemekler> yemekler;
  int success;
  YemeklerCevap({
    required this.yemekler,
    required this.success,
  });

  factory YemeklerCevap.fromJson(Map<String, dynamic> json) {
    int success = json["success"] as int;
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemekler = jsonArray.map((e) => Yemekler.fromJson(e)).toList();

    return YemeklerCevap(yemekler: yemekler, success: success);
  }
}
