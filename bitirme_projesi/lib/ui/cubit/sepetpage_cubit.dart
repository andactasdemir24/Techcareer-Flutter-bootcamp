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
}
