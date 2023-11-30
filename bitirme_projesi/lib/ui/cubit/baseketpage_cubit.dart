import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/data/repo/sepet_dap_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetPageCubit extends Cubit<List<Sepet>> {
  SepetPageCubit() : super(<Sepet>[]);

  var yrepo = SepetDaoRepository();

  Future<void> sepetiYukle(String kullanici_adi) async {
    var liste = await yrepo.sepetiYukle(kullanici_adi);
    emit(liste);
  }

  Future<void> urunSil(int sepet_yemek_id, String kullanici_adi) async {
    await yrepo.urunSil(sepet_yemek_id, kullanici_adi);
  }

  void sil(List<Sepet> sepetListesi) {
    for (var sil in sepetListesi) {
      urunSil(sil.sepet_yemek_id, 'andac');
    }
  }

  double hesaplaToplamFiyat(List<Sepet> sepetListesi) {
    double toplam = 0;
    for (var urun in sepetListesi) {
      toplam += urun.yemek_fiyat * urun.yemek_siparis_adet;
    }
    return toplam;
  }
}
