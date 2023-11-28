import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async {
    var iosAayari = const DarwinInitializationSettings();
    var androidAayari = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var kurulumAyari = InitializationSettings(android: androidAayari, iOS: iosAayari);
    await flp.initialize(kurulumAyari);
  }

  Future<void> bildirimGoster() async {
    var iosBildirimDetay = const DarwinNotificationDetails();
    var androidBildirimDetay = const AndroidNotificationDetails("id", "name",
        channelDescription: "acıklama", priority: Priority.high, importance: Importance.max);
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay, iOS: iosBildirimDetay);
    await flp.show(0, 'Başlik', 'İçcerik', bildirimDetay, payload: "Merhaba");
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              bildirimGoster();
            },
            child: const Text('Bildirimleri Göster')),
      ),
    );
  }
}
