import 'package:bitirme_projesi/ui/cubit/favoripage_cubit.dart';
import 'package:bitirme_projesi/ui/view/home/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entity/yemekler.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favoriler"),
        ),
        body: BlocBuilder<FavoritePageCubit, List<Yemekler>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: context.read<FavoritePageCubit>().favoriler.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(yemek: state[index]),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      child: ListTile(
                        title: Text(context.read<FavoritePageCubit>().favoriler[index].yemek_adi),
                        subtitle: Text(context.read<FavoritePageCubit>().favoriler[index].yemek_fiyat.toString()),
                        leading: Image.network(
                          'http://kasimadalan.pe.hu/yemekler/resimler/${context.read<FavoritePageCubit>().favoriler[index].yemek_resim_adi}',
                          height: 300,
                          fit: BoxFit.cover,
                        ),
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
