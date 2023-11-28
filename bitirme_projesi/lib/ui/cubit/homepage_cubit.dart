import 'package:bitirme_projesi/data/repo/yemekler_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/yemekler.dart';

class HomePageCubit extends Cubit<List<Yemekler>> {
  HomePageCubit() : super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await yrepo.yemekleriYukle();
    emit(liste);
  }
}
