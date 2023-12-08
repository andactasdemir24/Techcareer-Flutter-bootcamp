import 'package:flutter/material.dart';
import 'package:bitirme_projesi/data/constants/color_const.dart';
import '../constants/mediaquery_const.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: cOrange,
            fixedSize: Size(displayWidth(context) * 0.9, displayHeight(context) * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: onPressed,
        child: text);
  }
}
