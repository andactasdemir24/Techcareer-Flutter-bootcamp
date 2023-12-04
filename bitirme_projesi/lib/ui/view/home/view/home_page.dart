import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/view/home/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/color_const.dart';
import '../../../../data/entity/yemekler.dart';
import '../widgets/custom_stack.dart';
import '../widgets/foods_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: FoodsStack(),
          ),
          BlocBuilder<HomePageCubit, List<Yemekler>>(
            builder: (context, yemeklerListesi) {
              if (yemeklerListesi.isNotEmpty) {
                return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: (1.4 / 2)),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          var yemek = yemeklerListesi[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(yemek: yemek),
                                  ),
                                ).then((value) {
                                  context.read<HomePageCubit>().yemekleriYukle();
                                });
                              },
                              child: FoodsDetails(yemek: yemek));
                        }, childCount: yemeklerListesi.length)));
              } else {
                return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ],
      ),
    );
  }
}
