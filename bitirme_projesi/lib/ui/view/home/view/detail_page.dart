// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitirme_projesi/data/constants/text_const.dart';
import 'package:bitirme_projesi/ui/cubit/detailpage_cubit.dart';
import 'package:bitirme_projesi/ui/view/main/mainview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/constants/color_const.dart';
import '../../../../data/entity/yemekler.dart';
import '../widgets/custom_pay_button.dart';

class DetailPage extends StatefulWidget {
  final Yemekler yemek;
  const DetailPage({
    Key? key,
    required this.yemek,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.yemek.yemek_fiyat * counter.toDouble();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appbarText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomDetailFoodImage(widget: widget),
          const SizedBox(height: 50),
          Text(
            '₺${widget.yemek.yemek_fiyat.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: cMain, fontSize: 30),
          ),
          Text(
            widget.yemek.yemek_adi,
            style: const TextStyle(fontWeight: FontWeight.bold, color: cBlack, fontSize: 30),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) {
                        counter--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove_shopping_cart,
                    size: 35,
                  )),
              const SizedBox(width: 20),
              Text(
                counter.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 35,
                  )),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:  cOrange,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () async {
                if (counter > 0) {
                  await context
                      .read<DetailPageCubit>()
                      .sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat,
                          counter, 'andac')
                      .then((value) => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text(success),
                                content: const Text(alertDesc),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    child: const Text(alertButton),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const BottomNavigation(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )));
                } else {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(warning),
                        content: const Text(increase),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text(alertButton),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    addBasket,
                    style: TextStyle(color: cWhite, fontSize: 18),
                  ),
                  Text(
                    totalPrice.toString(),
                    style: const TextStyle(color: cWhite, fontSize: 18),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
