import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todo_dao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit() : super(0);

  var trepo = TodoDaoRepository();

  Future<void> guncelle(int todoId, String name) async {
    await trepo.guncelle(todoId, name);
  }
}
