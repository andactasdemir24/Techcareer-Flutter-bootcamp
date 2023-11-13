import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {calculate(btnText)},
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), fixedSize: const Size(70, 70), backgroundColor: btnColor),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 16, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('AC', Colors.grey, Colors.black),
                  numButton('+/-', Colors.grey, Colors.black),
                  numButton('%', Colors.grey, Colors.black),
                  numButton('', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('7', Colors.grey[850]!, Colors.white),
                  numButton('8', Colors.grey[850]!, Colors.white),
                  numButton('9', Colors.grey[850]!, Colors.white),
                  numButton('', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('4', Colors.grey[850]!, Colors.white),
                  numButton('5', Colors.grey[850]!, Colors.white),
                  numButton('6', Colors.grey[850]!, Colors.white),
                  numButton('', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('1', Colors.grey[850]!, Colors.white),
                  numButton('2', Colors.grey[850]!, Colors.white),
                  numButton('3', Colors.grey[850]!, Colors.white),
                  numButton('+', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => calculate('0'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      fixedSize: const Size(160, 70),
                      alignment: AlignmentDirectional.centerStart,
                      backgroundColor: Colors.grey[850],
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  numButton('.', Colors.grey[850]!, Colors.white),
                  numButton('=', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  // Logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "0";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "AC") {
      result = "";
      text = "0";
      firstNumber = 0;
      secondNumber = 0;
      operation = "";
    } else if (btnText == "+") {
      if (operation.isNotEmpty) {
        calculate("=");
        firstNumber = int.parse(result);
        result = "";
      } else {
        firstNumber = int.parse(text);
        result = "";
      }
      operation = btnText;
    } else if (btnText == "=") {
      if (operation.isEmpty) {
        return;
      }
      secondNumber = int.parse(result);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      operation = "";
    } else {
      result = (result + btnText).toString();
    }

    setState(() {
      if (operation.isEmpty) {
        text = result;
      } else {
        text = "$firstNumber $operation $result";
      }
    });
  }
}
