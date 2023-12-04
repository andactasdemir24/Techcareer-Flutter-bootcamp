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
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1, 
            blurRadius: 5, 
            offset: const Offset(0, 3), 
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
