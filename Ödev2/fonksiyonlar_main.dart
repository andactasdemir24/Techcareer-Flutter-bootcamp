import 'fonksiyonlar.dart';

void main() {
  //Nesneyi çağır
  var f = fonksiyonlar();
  //1. Madde
  double km = 452;
  double mil = f.kmToMiles(km);
  print('$km kilometre, $mil mil eder.');

  //2.Madde
  double uzunluk = 5.0;
  double genislik = 3.0;
  double alan = f.dikdortgenAlanHesapla(uzunluk, genislik);
  print('Dikdörtgenin alanı: $alan birim kare.');

  //3.Madde
  int sayi = 5;
  int sonuc = f.faktoriyelHesapla(sayi);
  print('$sayi sayısının faktöriyeli: $sonuc');

  //4.Madde
  String kelime = "deneme";
  int result = f.eSayisiHesapla(kelime);
  print('"$kelime" kelimesindeki "e" harfi sayısı: $result');

  //ikinci sayfa 1.Madde açı hesaplama
  int kenar = 4;
  try {
    double aci = f.aciHesapla(kenar);
    print('$kenar kenarlı bir çokgenin her bir iç açısı: $aci derece');
  } catch (e) {
    print('Hata: $e');
  }
  //ikinci sayfa 2.Madde Maaş hesaplama
  int gun = 20;
  double salary = f.maasHesapla(gun);
  print('$gun gün çalışarak elde edilen maaş: $salary TL');

  //ikinci sayfa 3.Madde Maaş hesaplama
  int parkUcreti = 3; 
  double fee = f.parkUcretiHesapla(parkUcreti);
  print('$parkUcreti saat otopark ücreti: $fee TL');
}
