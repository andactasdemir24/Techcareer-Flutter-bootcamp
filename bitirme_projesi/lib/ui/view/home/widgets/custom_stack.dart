import 'package:flutter/material.dart';

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
        Image.asset(
          'assets/images/appbar.png',
          width: MediaQuery.of(context).size.width,
          height: 230,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 90,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
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
            bottom: 30,
            child: Center(
                child: Text(
              foods,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            )))
      ],
    );
  }
}