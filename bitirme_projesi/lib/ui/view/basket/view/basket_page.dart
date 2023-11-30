import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/ui/cubit/baseketpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
                      return Padding(
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF7B632)),
                        onPressed: () {
                          setState(() {
                            showOverlay(context);
                          });
                          context.read<SepetPageCubit>().sil(sepetListesi);
                        },
                        child: const Text(
                          payButtonText,
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
