import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/color_const.dart';
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
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
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
                    color: cOrange,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                context
                    .read<SepetPageCubit>()
                    .urunAdetAzaltVeGerekirseSil(sepet.sepet_yemek_id, 'andac')
                    .whenComplete(() {
                  context.read<SepetPageCubit>().sepetiYukle('andac');
                });
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: cGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
