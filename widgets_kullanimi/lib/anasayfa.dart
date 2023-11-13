// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String alinanVeri = "";
  String imageName = "baklava.png";
  bool swichController = false;
  bool checkboxController = false;
  int radioValue = 0;
  bool progressControl = false;
  TextEditingController tfController = TextEditingController();
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = 'Türkiye';

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(
                    hintText: "Veri",
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  alinanVeri = tfController.text;
                  tfController.text = "";
                  setState(() {});
                },
                child: const Text("Oku"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      imageName = "kofte.png";
                      setState(() {});
                    },
                    child: const Text("Resim 1"),
                  ),
                  //Image.asset("images/$imageName"),
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$imageName"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      imageName = "ayran.png";
                      setState(() {});
                    },
                    child: const Text("Resim 2"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: SwitchListTile(
                      title: const Text("Dart"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: swichController,
                      onChanged: (value) {
                        swichController = value;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkboxController,
                      onChanged: (value) {
                        checkboxController = value!;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: RadioListTile(
                      title: const Text("Barcelona"),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (value) {
                        radioValue = value!;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: RadioListTile(
                      title: const Text("Real Madrid"),
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (value) {
                        radioValue = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      progressControl = true;
                      setState(() {});
                    },
                    child: const Text("Başla"),
                  ),
                  Visibility(
                    visible: progressControl,
                    child: const CircularProgressIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      progressControl = false;
                      setState(() {});
                    },
                    child: const Text("Dur"),
                  ),
                ],
              ),
              Text(ilerleme.toString()),
              Slider(
                max: 100.0,
                min: 0.0,
                value: ilerleme,
                onChanged: (value) {
                  ilerleme = value;
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 128,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                          .then((value) {
                        tfSaat.text = '${value!.hour} : ${value.minute}';
                      });
                    },
                    icon: const Icon(Icons.access_time),
                  ),
                  SizedBox(
                    width: 128,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(hintText: "Tarih"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030))
                          .then(
                        (value) {
                          tfTarih.text = '${value!.day} / ${value.month} / ${value.year}';
                        },
                      );
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
              DropdownButton(
                value: secilenUlke,
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                items: ulkelerListesi.map((ulke) {
                  return DropdownMenuItem(value: ulke, child: Text(ulke));
                }).toList(),
                onChanged: (veri) {
                  setState(() {
                    secilenUlke = veri!;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  print('Container tek tıklandı');
                },
                onDoubleTap: () {
                  print('Container çift tıklandı');
                },
                onLongPress: () {
                  print('Container üzerine uzun tıklandı');
                },
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Swich durum: $swichController");
                  print("Checkbox durum: $checkboxController");
                  print("Radio değer: $radioValue");
                  print("Slider ilerleme: $ilerleme");
                  print("Seçilen Ülke : $secilenUlke");
                },
                child: const Text("Göster"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
