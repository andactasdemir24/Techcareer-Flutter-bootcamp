import 'package:bitirme_projesi/data/constants/color_const.dart';
import 'package:bitirme_projesi/ui/cubit/favoripage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/text_const.dart';
import '../../../data/entity/yemekler.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBg,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            favorite,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<FavoritePageCubit>().clearAll();
                },
                child: const Text(
                  'Clear All',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: BlocBuilder<FavoritePageCubit, List<Yemekler>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: context.read<FavoritePageCubit>().favoriler.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    color: cWhite,
                    child: ListTile(
                      title: Text(context.read<FavoritePageCubit>().favoriler[index].yemek_adi,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:
                          Text('Price: ${context.read<FavoritePageCubit>().favoriler[index].yemek_fiyat.toString()}'),
                      leading: Image.network(
                        'http://kasimadalan.pe.hu/yemekler/resimler/${context.read<FavoritePageCubit>().favoriler[index].yemek_resim_adi}',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
