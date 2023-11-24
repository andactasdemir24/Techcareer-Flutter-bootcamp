import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todo_dao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit() : super(0);
  var trepo = TodoDaoRepository();

  Future<void> kaydet(String name) async {
    await trepo.kaydet(name);
  }
}
