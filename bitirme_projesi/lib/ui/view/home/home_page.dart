import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/view/home/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entity/yemekler.dart';

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
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/appbar.png',
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 90,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for menu, ingredients',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                    bottom: 30,
                    child: Center(
                        child: Text(
                      'Ürünler',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )))
              ],
            ),
          ),
          BlocBuilder<HomePageCubit, List<Yemekler>>(
            builder: (context, yemeklerListesi) {
              if (yemeklerListesi.isNotEmpty) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12, // Number of columns
                      childAspectRatio: (1.5 / 2), // Adjust the size ratio of items
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
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
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                      width: 200,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color(0xffc2e3f3), Color(0xff6aa3c1)],
                                          ))),
                                  Column(
                                    children: [
                                      Image.network(
                                        'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}',
                                        width: 160, // Resmin genişliğini ayarla
                                        height: 130, // Resmin yüksekliğini ayarla
                                      ),
                                      Text(
                                        yemek.yemek_adi,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '₺${yemek.yemek_fiyat.toString()}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                                            ),
                                            const Icon(
                                              Icons.shopping_basket_rounded,
                                              color: Color(0xffF7BC38),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                      childCount: yemeklerListesi.length,
                    ),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
