import 'package:odev7/data/entity/todo.dart';
import 'package:odev7/sqlite/veritabani_yardimcisi.dart';

class TodoDaoRepository {
  Future<List<Todo>> todoYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM Todo");
    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var todoId = satir["todoId"];
      var name = satir["name"];

      return Todo(todoId: todoId, name: name);
    });
  }

  Future<List<Todo>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> satirlar = await db.rawQuery("SELECT * FROM Todo WHERE name like '%%$aramaKelimesi'");
    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var todoId = satir["todoId"];
      var name = satir["name"];

      return Todo(todoId: todoId, name: name);
    });
  }

  Future<void> sil(int todoId) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("Todo", where: "todoId = ?", whereArgs: [todoId]);
  }

  Future<void> guncelle(int todoId, String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncelleTodo = <String, dynamic>{};
    guncelleTodo["name"] = name;
    await db.update("Todo", guncelleTodo, where: "todoId = ?", whereArgs: [todoId]);
  }

  Future<void> kaydet(String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var yeniTodo = <String, dynamic>{};
    yeniTodo["name"] = name;

    await db.insert("Todo", yeniTodo);
  }
}
