import 'package:flutter/material.dart';
import 'package:odev3/basket_page.dart';
import 'package:odev3/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void increment() {
    counter++;
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var ekranBilgisi = MediaQuery.sizeOf(context);
    final double height = ekranBilgisi.height;
    final double width = ekranBilgisi.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Text(
          localization.appbarBaslik,
          style: const TextStyle(fontFamily: 'Oswald'),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 5, vertical: height / 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(height / 40), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(110), // Image radius
                  child: Image.asset('assets/food.jpg', fit: BoxFit.cover),
                ),
              )),
          Container(
              width: width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height / 40),
                color: containerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localization.yemekBaslik,
                              style: TextStyle(fontSize: 25, color: textColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              localization.yemekAciklama,
                              style: TextStyle(fontSize: 12, color: textColor),
                            ),
                          ],
                        ),
                        Text(
                          localization.yemekFiyat,
                          style: TextStyle(fontSize: 25, color: textColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        const Icon(Icons.star_border_outlined),
                        SizedBox(width: width / 100),
                        Text(
                          '4.8',
                          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: width / 50),
                        const Icon(Icons.punch_clock_outlined),
                        SizedBox(width: width / 100),
                        Text(
                          localization.yemekSure,
                          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: height / 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        localization.aciklamaBaslik,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(localization.aciklama),
                    SizedBox(height: height / 30),
                    Row(
                      children: [
                        IconButton(
                            color: iconColor,
                            onPressed: () {
                              setState(() {
                                decrement();
                              });
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                            )),
                        Text(
                          counter.toString(),
                          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            color: iconColor,
                            onPressed: () {
                              setState(() {
                                increment();
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle,
                            )),
                        SizedBox(width: width / 10),
                        ElevatedButton(
                          onPressed: () {
                            dialogBuilder(context);
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: iconColor),
                          child: Text(
                            localization.butonAciklama,
                            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(height: height / 50),
          SizedBox(
              width: width / 1.1,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BasketPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: iconColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    localization.sepeteGit,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basket'),
        content: const Text('Are you sure you want to add'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Add'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
