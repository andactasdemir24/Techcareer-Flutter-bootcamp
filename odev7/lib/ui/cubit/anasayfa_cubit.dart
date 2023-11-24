import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todo.dart';
import 'package:odev7/data/repo/todo_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Todo>> {
  AnasayfaCubit() : super(<Todo>[]);

  var trepo = TodoDaoRepository();

  Future<void> todoYukle() async {
    var liste = await trepo.todoYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await trepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int todoId) async {
    await trepo.sil(todoId);
    todoYukle();
  }
}
