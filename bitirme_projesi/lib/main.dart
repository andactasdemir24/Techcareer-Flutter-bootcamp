import 'package:bitirme_projesi/ui/cubit/detailpage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/sepetpage_cubit.dart';
import 'package:bitirme_projesi/ui/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/view/home/sepet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomePageCubit()),
          BlocProvider(create: (context) => DetailPageCubit()),
          BlocProvider(create: (context) => SepetPageCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SepetPage(),
        ));
  }
}