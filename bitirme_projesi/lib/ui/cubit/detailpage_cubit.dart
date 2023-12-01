import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/data/repo/sepet_dap_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageCubit extends Cubit<List<Sepet>> {
  DetailPageCubit() : super(<Sepet>[]);

  var yrepo = SepetDaoRepository();

  Future<void> sepeteEkle(
      String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    await yrepo.sepeteEkleGuncelle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }
}
