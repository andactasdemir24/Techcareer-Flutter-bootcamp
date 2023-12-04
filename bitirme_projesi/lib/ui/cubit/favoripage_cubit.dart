import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/yemekler.dart';

class FavoritePageCubit extends Cubit<List<Yemekler>> {
  FavoritePageCubit() : super(<Yemekler>[]);

  List<Yemekler> favoriler = [];
  bool isFavorited = false;

  void toggleFavorite(Yemekler yemek) {
    if (favoriler.any((favYemek) => favYemek.yemek_id == yemek.yemek_id)) {
      favoriler.removeWhere((favYemek) => favYemek.yemek_id == yemek.yemek_id);
    } else {
      favoriler.add(yemek);
    }

    emit(List.from(favoriler));
  }
}
