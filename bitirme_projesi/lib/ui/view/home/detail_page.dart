// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitirme_projesi/ui/cubit/detailpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/entity/yemekler.dart';
import '../main/mainview.dart';

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
          'Ürün Detay',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffc2e3f3), Color(0xff6aa3c1)],
                      ) // Half of the container width for an oval shape
                      ),
                ),
                Image.network(
                  'http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}',
                  height: 300,
                  fit: BoxFit.cover, // Yüksekliği artırın
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Text(
            '₺${widget.yemek.yemek_fiyat.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff6aa3c1), fontSize: 30),
          ),
          Text(
            widget.yemek.yemek_adi,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
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
                  backgroundColor: const Color(0xffF7B632),
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () async {
                await context
                    .read<DetailPageCubit>()
                    .sepeteEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, counter,
                        'andac')
                    .then((value) => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Sepet'),
                            content: Text('AlertDialog description'),
                          ),
                        ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sepete Ekle',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    totalPrice.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
