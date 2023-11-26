import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisiler_dao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit() : super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(String kisi_Id, String kisi_Ad, String kisi_Tel) async {
    await krepo.guncelle(kisi_Id, kisi_Ad, kisi_Tel);
  }
}
