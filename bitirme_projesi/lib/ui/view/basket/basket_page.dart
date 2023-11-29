import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/ui/cubit/baseketpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../main/mainview.dart';

class SepetPage extends StatefulWidget {
  const SepetPage({Key? key}) : super(key: key);

  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  bool showLottieAnimation = false;
  @override
  void initState() {
    super.initState();
    context.read<SepetPageCubit>().sepetiYukle('andac');
  }

  late OverlayEntry overlayEntry;
  bool isOverlayDisplayed = false;

  void showOverlay(BuildContext context) {
    if (!isOverlayDisplayed) {
      overlayEntry = OverlayEntry(
        builder: (context) => Center(
          child: Lottie.asset('assets/lottie/lottie.json', height: 200, width: 350, fit: BoxFit.cover),
        ),
      );

      Overlay.of(context).insert(overlayEntry);
      isOverlayDisplayed = true;

      Future.delayed(const Duration(milliseconds: 1150), () {
        overlayEntry.remove();
        isOverlayDisplayed = false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigation(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text(
          'Basket',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SepetPageCubit, List<Sepet>>(
        builder: (context, sepetListesi) {
          if (sepetListesi.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepetListesi.length,
                    itemBuilder: (context, index) {
                      var sepet = sepetListesi[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0xffc2e3f3), Color(0xff6aa3c1)],
                                        ),
                                      ),
                                      child: Image.network(
                                        'http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
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
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                              'Adet: ${sepet.yemek_siparis_adet}',
                                              style: const TextStyle(fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              'Toplam Fiyat: ₺${sepet.yemek_fiyat * sepet.yemek_siparis_adet}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffF7B632),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context
                                                .read<SepetPageCubit>()
                                                .urunSil(sepet.sepet_yemek_id, 'andac')
                                                .whenComplete(() {
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    BlocBuilder<SepetPageCubit, List<Sepet>>(
                      builder: (context, sepetListesi) {
                        double toplamFiyat = context.read<SepetPageCubit>().hesaplaToplamFiyat(sepetListesi);
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Toplam Fiyat: ${toplamFiyat.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF7B632)),
                        onPressed: () {
                          setState(() {
                            showOverlay(context);
                          });
                        },
                        child: const Text(
                          'Ödeme Yap',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
