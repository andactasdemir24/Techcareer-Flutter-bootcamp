import 'package:flutter/material.dart';

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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffc2e3f3), Color(0xff6aa3c1)],
                ) // Half of the container width for an oval shape
                ),
          ),
          Image.network(
            'http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}',
            height: 300,
            fit: BoxFit.cover, // Yüksekliği artırın
          ),
        ],
      ),
    );
  }
}
