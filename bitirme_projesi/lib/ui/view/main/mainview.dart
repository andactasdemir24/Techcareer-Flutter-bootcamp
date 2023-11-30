import 'package:bitirme_projesi/ui/view/basket/view/basket_page.dart';
import 'package:bitirme_projesi/ui/view/home/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/color_const.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SepetPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank_outlined,
              size: 30,
            ),
            label: 'Foods',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket_outlined,
              size: 30,
            ),
            label: 'Basket',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: cOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}
