import 'package:bitirme_projesi/data/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/components/custom_button.dart';
import '../../../../data/constants/image_const.dart';
import '../../../../data/constants/mediaquery_const.dart';
import '../../../../data/constants/text_const.dart';
import '../../main/mainview.dart';
import '../model/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  bool isSeen = false;

  Future<void> saveIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', true);
  }

  List<OnboardingModel> onbList = [
    OnboardingModel(onb1Image, onb1Title, onb1Description),
    OnboardingModel(onb2Image, onb2Title, onb2Description),
    OnboardingModel(onb3Image, onb3Title, onb3Description),
  ];

  PageController controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: controller,
      itemCount: onbList.length,
      onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                onbList[index].image,
                height: 300,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayHeight(context) * 0.05, vertical: displayHeight(context) * 0.03),
                    child: Text(onbList[index].title,
                        style: const TextStyle(fontSize: 31, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.01),
                      child: Text(onbList[index].description,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onbList.length,
                        (index) => Container(
                          height: 5,
                          width: currentIndex == index ? 30 : 5,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentIndex == index ? cOrange : cGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: const Text(
                      cont,
                      style: TextStyle(color: cWhite, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentIndex == onbList.length - 1) {
                          saveIsSeen();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavigation(),
                            ),
                          );
                        }
                      });
                      controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
