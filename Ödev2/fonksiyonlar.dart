class fonksiyonlar {
  //Madde 1 Kilometreyi mil birimine dönüştürme
  double kmToMiles(double kilometers) {
    double mil = kilometers * 0.621;
    return mil;
  }

  //Madde 2
  double dikdortgenAlanHesapla(double uzunluk, double genislik) {
    double alan = uzunluk * genislik;
    return alan;
  }

  //Madde 3
  int faktoriyelHesapla(int n) {
    if (n == 0) {
      return 1;
    } else {
      int faktoriyel = 1;
      for (int i = 1; i <= n; i++) {
        faktoriyel *= i;
      }
      return faktoriyel;
    }
  }

  //Madde 4
  int eSayisiHesapla(String kelime) {
    int count = 0;
    for (int i = 0; i < kelime.length; i++) {
      if (kelime[i] == 'e' || kelime[i] == 'E') {
        count++;
      }
    }
    return count;
  }

  //2.Sayfa 1.Madde
  double aciHesapla(int kenar) {
    if (kenar < 3) {
      throw Exception("Kenar sayısı 3'ten küçük olamaz.");
    }
    double aci = ((kenar - 2) * 180) / kenar;
    return aci;
  }

  //2.Sayfa 2.Madde
  double maasHesapla(int gunSayisi) {
    double CalismaSaati = 40.0;
    double mesaiSaati = 80.0;
    int gunlukCalisma = 8;
    int mesai = 150;
    int maxCalismaSaati = gunSayisi * gunlukCalisma;

    if (maxCalismaSaati <= mesai) {
      return maxCalismaSaati * CalismaSaati;
    } else {
      int bitmeSaati = maxCalismaSaati - mesai;
      return (mesai * CalismaSaati) + (bitmeSaati * mesaiSaati);
    }
  }

//2.Sayfa 3.Madde
  double parkUcretiHesapla(int saat) {
    double birSaatUcret = 50.0;
    double herbirSaat = 10.0;

    if (saat <= 0) {
      return 0.0;
    } else if (saat == 1) {
      return birSaatUcret;
    } else {
      double ekSaat = saat - 1;
      double ekUcret = ekSaat * herbirSaat;
      return birSaatUcret + ekUcret;
    }
  }
}
