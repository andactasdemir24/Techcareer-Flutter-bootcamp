import 'package:flutter/material.dart';

import '../../../../data/entity/sepet.dart';

class BasketImage extends StatelessWidget {
  const BasketImage({
    super.key,
    required this.sepet,
  });

  final Sepet sepet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffc2e3f3), Color(0xff6aa3c1)],
        ),
      ),
      child: Image.network(
        'http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}',
        fit: BoxFit.cover,
      ),
    );
  }
}

