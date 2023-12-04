import 'package:bitirme_projesi/ui/cubit/detailpage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/favoripage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/baseketpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/view/lottie/lottie_page.dart';

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
          BlocProvider(create: (context) => FavoritePageCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WelcomePage(),
        ));
  }
}
