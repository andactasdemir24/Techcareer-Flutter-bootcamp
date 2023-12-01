import 'package:flutter/material.dart';

import '../../../../data/constants/color_const.dart';
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
          colors: [cGradient, cWhite],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Image.network(
        'http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}',
        fit: BoxFit.cover,
      ),
    );
  }
}
