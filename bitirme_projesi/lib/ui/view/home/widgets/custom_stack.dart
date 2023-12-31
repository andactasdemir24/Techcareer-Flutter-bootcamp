import 'package:flutter/material.dart';

import '../../../../data/constants/color_const.dart';
import '../../../../data/constants/image_const.dart';
import '../../../../data/constants/text_const.dart';

class FoodsStack extends StatelessWidget {
  const FoodsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Image.asset(
            appbarLottie,
            width: MediaQuery.of(context).size.width,
            height: 170,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: cWhite,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: search,
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),
        ),
        const Positioned(
            bottom: 5,
            child: Center(
                child: Text(
              foods,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: cWhite),
            )))
      ],
    );
  }
}
