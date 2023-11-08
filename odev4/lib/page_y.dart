import 'package:flutter/material.dart';
import 'package:odev4/home_page.dart';

class PageY extends StatelessWidget {
  const PageY({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'SAYFA Y',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text(
            'Go Home Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
