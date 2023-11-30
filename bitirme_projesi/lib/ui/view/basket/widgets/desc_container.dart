import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/entity/sepet.dart';
import '../../../cubit/baseketpage_cubit.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.sepet,
  });

  final Sepet sepet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sepet.yemek_adi,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Piece: ${sepet.yemek_siparis_adet}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Total price: ₺${sepet.yemek_fiyat * sepet.yemek_siparis_adet}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xffF7B632),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                context.read<SepetPageCubit>().urunSil(sepet.sepet_yemek_id, 'andac').whenComplete(() {
                  context.read<SepetPageCubit>().sepetiYukle('andac');
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}