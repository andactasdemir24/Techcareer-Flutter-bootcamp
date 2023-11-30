import 'package:flutter/material.dart';

import '../../../../data/constants/color_const.dart';
import '../../../../data/entity/yemekler.dart';

class FoodsDetails extends StatelessWidget {
  const FoodsDetails({
    super.key,
    required this.yemek,
  });

  final Yemekler yemek;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [cGradient, cMain],
                  ))),
          Column(
            children: [
              Image.network(
                'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}',
                width: 160, // Resmin genişliğini ayarla
                height: 130, // Resmin yüksekliğini ayarla
              ),
              Text(
                yemek.yemek_adi,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₺${yemek.yemek_fiyat.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: cWhite, fontSize: 18),
                    ),
                    const Icon(
                      Icons.shopping_basket_rounded,
                      color: cOrange,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
