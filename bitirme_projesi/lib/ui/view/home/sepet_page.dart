import 'package:bitirme_projesi/data/entity/sepet.dart';
import 'package:bitirme_projesi/ui/cubit/sepetpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetPage extends StatefulWidget {
  const SepetPage({super.key});

  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  @override
  void initState() {
    super.initState();
    context.read<SepetPageCubit>().sepetiYukle('andac');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SepetPageCubit, List<Sepet>>(
        builder: (context, sepetListesi) {
          if (sepetListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: sepetListesi.length,
              itemBuilder: (context, index) {
                var sepet = sepetListesi[index];
                return Text(sepet.kullanici_adi);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
