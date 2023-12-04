import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/ui/cubit/baseketpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../data/constants/color_const.dart';
import '../../../../data/constants/image_const.dart';
import '../../../../data/constants/text_const.dart';
import '../../main/mainview.dart';
import '../widgets/basket_image.dart';
import '../widgets/desc_container.dart';

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
          child: Lottie.asset(basketPageLottie, height: 200, width: 350, fit: BoxFit.cover),
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
      backgroundColor: cBg,
      appBar: AppBar(
        title: const Text(
          alertTitle,
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
                      return Dismissible(
                        key: Key(sepet.sepet_yemek_id.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          context.read<SepetPageCubit>().urunSil(sepet.sepet_yemek_id, 'andac').then((_) {
                            context.read<SepetPageCubit>().sepetiYukle('andac'); // Sepeti yeniden yükle
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      BasketImage(sepet: sepet),
                                    ],
                                  ),
                                  DescriptionContainer(sepet: sepet),
                                ],
                              ),
                            ],
                          ),
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
                            'Total price: ₺${toplamFiyat.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: cOrange),
                        onPressed: () {
                          setState(() {
                            showOverlay(context);
                          });
                          context.read<SepetPageCubit>().sil(sepetListesi);
                        },
                        child: const Text(
                          payButtonText,
                          style: TextStyle(color: cWhite, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: Text(
                addFoods,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
