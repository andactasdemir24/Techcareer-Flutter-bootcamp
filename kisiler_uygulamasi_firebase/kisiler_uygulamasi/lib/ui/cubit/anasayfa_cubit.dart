import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisiler_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();
  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kisileriYukle() async {
    var sorgu = collectionKisiler.orderBy("kisi_ad");
    //var sorgu = collectionKisiler.limit(2);

    sorgu.snapshots().listen((value) {
      var kisilerListesi = <Kisiler>[];

      var documents = value.docs;
      for (var document in documents) {
        var data = document.data();
        var key = document.id;
        var kisi = Kisiler.fromJson(data, key);
        kisilerListesi.add(kisi);
      }

      emit(kisilerListesi);
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    //var sorgu = collectionKisiler.where("kisi_ad", isEqualTo: aramaKelimesi);

    collectionKisiler.snapshots().listen((value) {
      var kisilerListesi = <Kisiler>[];

      var documents = value.docs;
      for (var document in documents) {
        var data = document.data();
        var key = document.id;
        var kisi = Kisiler.fromJson(data, key);

        if (kisi.kisi_ad.toLowerCase().contains(aramaKelimesi.toLowerCase())) {
          kisilerListesi.add(kisi);
        }
      }

      emit(kisilerListesi);
    });
  }

  Future<void> sil(String kisi_id) async {
    await krepo.sil(kisi_id);
  }
}
