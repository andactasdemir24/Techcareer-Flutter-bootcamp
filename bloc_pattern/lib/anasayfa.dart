import 'package:bloc_pattern/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatelessWidget {
  final TextEditingController tfSayi1 = TextEditingController();
  final TextEditingController tfSayi2 = TextEditingController();

  final int sonuc = 0;

  Anasayfa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Kullanımı'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, gelenSonuc) {
                  //Dinleme veya okuma
                  return Text(
                    gelenSonuc.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  );
                },
              ),
              TextField(
                controller: tfSayi1,
                decoration: const InputDecoration(hintText: 'Sayı 1'),
              ),
              TextField(
                controller: tfSayi2,
                decoration: const InputDecoration(hintText: 'Sayı 2'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().topla(tfSayi1.text, tfSayi2.text);
                    },
                    child: const Text('TOPLAMA'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().carpma(tfSayi1.text, tfSayi2.text);
                    },
                    child: const Text('ÇARPMA'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
