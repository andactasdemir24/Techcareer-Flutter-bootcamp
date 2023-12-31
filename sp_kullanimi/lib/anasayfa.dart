import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt('sayac') ?? 0;
    sayac = sayac + 1;

    setState(() {
      sp.setInt('sayac', sayac);
    });
  }

  Future<void> test() async {
    //Tanımlama
    var sp = await SharedPreferences.getInstance();

    //Veri kaydı
    sp.setString('ad', 'Ahmet');
    sp.setInt('yas', 23);
    sp.setDouble('boy', 1.70);
    sp.setBool('bekar', true);

    var liste = <String>[];
    liste.add('Ali');
    liste.add('Ece');

    sp.setStringList('liste', liste);

    //Veri silme
    //sp.remove('ad');

    //Veri okuma
    String gelenAd = sp.getString('ad') ?? 'isim yok';
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble('boy') ?? 0.0;
    bool gelenBekar = sp.getBool('bekar') ?? false;
    var gelenListe = sp.getStringList('liste') ?? <String>[];

    print('Gelen Ad : $gelenAd');
    print('Gelen Ad : $gelenYas');
    print('Gelen Ad : $gelenBoy');
    print('Gelen Ad : $gelenBekar');

    if (gelenListe != null) {
      for (var a in gelenListe) {
        print('Gelen Ad : $a');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Kullanımı'),
      ),
      body: Center(
        child: Text(
          'Açılış Sayısı : $sayac',
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
