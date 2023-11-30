import 'package:bitirme_projesi/ui/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/constants/image_const.dart';
import '../main/mainview.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isSeen = false;

  Future<void> loadIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      isSeen = preferences.getBool('seen') ?? false;
    });
  }

  @override
  void initState() {
    loadIsSeen();
    Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isSeen ? const BottomNavigation() : const OnboardingView(),
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          firstLottie,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
