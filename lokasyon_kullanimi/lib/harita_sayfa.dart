import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaSayfa extends StatefulWidget {
  const HaritaSayfa({super.key});

  @override
  State<HaritaSayfa> createState() => _HaritaSayfaState();
}

class _HaritaSayfaState extends State<HaritaSayfa> {
  var baslangicKonum = const CameraPosition(target: LatLng(39.9035233, 32.5979578), zoom: 11);
  Completer<GoogleMapController> haritaKontrol = Completer();

  Future<void> konumGit() async {
    GoogleMapController controller = await haritaKontrol.future;
    //41.0370175,28.974792,15z
    var gidilecekKonum = const CameraPosition(target: LatLng(41.0370175, 28.974792), zoom: 17);
    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harita'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GoogleMap(
                initialCameraPosition: baslangicKonum,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  haritaKontrol.complete(controller);
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  konumGit();
                },
                child: const Text('Konuma git'))
          ],
        ),
      ),
    );
  }
}
