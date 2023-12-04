import 'package:flutter/material.dart';

import '../../../../data/constants/color_const.dart';
import '../view/detail_page.dart';

class CustomDetailFoodImage extends StatelessWidget {
  const CustomDetailFoodImage({
    super.key,
    required this.widget,
  });

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: cBlue,
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [cGradient, cMain],
                )
                ),
          ),
          Image.network(
            'http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}',
            height: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
