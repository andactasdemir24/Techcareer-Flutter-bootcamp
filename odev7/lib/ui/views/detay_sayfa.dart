// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/detay_sayfa_cubit.dart';

import '../../data/entity/todo.dart';

class DetaySayfa extends StatefulWidget {
  final Todo todo;
  const DetaySayfa({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var todoNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    todoNameController.text = todo.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: todoNameController,
                decoration: const InputDecoration(hintText: "Kişi Ad"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DetaySayfaCubit>().guncelle(widget.todo.todoId, todoNameController.text);
                },
                child: const Text("Güncelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
