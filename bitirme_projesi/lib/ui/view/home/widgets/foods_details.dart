import 'package:bitirme_projesi/ui/cubit/favoripage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/constants/color_const.dart';
import '../../../../data/entity/yemekler.dart';

class FoodsDetails extends StatefulWidget {
  const FoodsDetails({
    super.key,
    required this.yemek,
  });

  final Yemekler yemek;

  @override
  State<FoodsDetails> createState() => _FoodsDetailsState();
}

class _FoodsDetailsState extends State<FoodsDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cGradient, cMain],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          )),
          Column(
            children: [
              BlocBuilder<FavoritePageCubit, List<Yemekler>>(
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: context
                              .read<FavoritePageCubit>()
                              .favoriler
                              .any((favYemek) => favYemek.yemek_id == widget.yemek.yemek_id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<FavoritePageCubit>().isFavorited = !context.read<FavoritePageCubit>().isFavorited;
                      context.read<FavoritePageCubit>().toggleFavorite(widget.yemek);
                    },
                  );
                },
              ),
              Image.network(
                'http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}',
                height: 120,
              ),
              Text(
                widget.yemek.yemek_adi,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₺${widget.yemek.yemek_fiyat.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: cBlack, fontSize: 18),
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
