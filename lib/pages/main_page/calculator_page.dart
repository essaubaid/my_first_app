import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_first_app/models/calculator.dart';
import 'package:my_first_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Consumer<CalculatorModel>(builder: (
        BuildContext context,
        value,
        Widget? child,
      ) {
        return Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: calculatorButtons(context));
      }),
    );
  }

  Column calculatorButtons(BuildContext context) {
    CalculatorModel calculatorModel = Provider.of<CalculatorModel>(context);
    dynamic text = calculatorModel.display;
    //Queue queue = Queue.of(<dynamic>['0']);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  bottom: 20.0,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildButton(
              color: Color(0xFFD4D4D4),
              text: 'C',
              fontColor: Colors.black,
              onPressed: () {
                calculatorModel.clearAll();
              },
            ),
            BuildButton(
              color: Color(0xFFD4D4D4),
              text: '+/-',
              fontColor: Colors.black,
            ),
            BuildButton(
              color: Color(0xFFD4D4D4),
              text: '%',
              fontColor: Colors.black,
            ),
            BuildButton(
              color: Color(0xFFff9500),
              text: '/',
              onPressed: () {
                calculatorModel.setOperator('/');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildButton(
              text: '7',
              onPressed: () {
                calculatorModel.addDisplay('7');
              },
            ),
            BuildButton(
              text: '8',
              onPressed: () {
                calculatorModel.addDisplay('8');
              },
            ),
            BuildButton(
              text: '9',
              onPressed: () {
                calculatorModel.addDisplay('9');
              },
            ),
            BuildButton(
              color: Color(0xFFff9500),
              text: 'X',
              onPressed: () {
                calculatorModel.setOperator('x');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildButton(
              text: '4',
              onPressed: () {
                calculatorModel.addDisplay('4');
              },
            ),
            BuildButton(
              text: '5',
              onPressed: () {
                calculatorModel.addDisplay('5');
              },
            ),
            BuildButton(
              text: '6',
              onPressed: () {
                calculatorModel.addDisplay('6');
              },
            ),
            BuildButton(
              color: Color(0xFFff9500),
              text: '-',
              onPressed: () {
                calculatorModel.setOperator('-');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildButton(
              text: '1',
              onPressed: () {
                calculatorModel.addDisplay('1');
              },
            ),
            BuildButton(
              text: '2',
              onPressed: () {
                calculatorModel.addDisplay('2');
              },
            ),
            BuildButton(
              text: '3',
              onPressed: () {
                calculatorModel.addDisplay('3');
              },
            ),
            BuildButton(
              color: Color(0xFFff9500),
              text: '+',
              onPressed: () {
                calculatorModel.setOperator('+');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(
            //   height: 60,
            //   width: MediaQuery.of(context).size.width / 2.5,
            //   child: ElevatedButton(
            //     onPressed: (() => {}),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFF505050),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //     ),
            //     child: const Text(
            //       "0",
            //       style: TextStyle(
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // BuildButton(
            //   text: '0',
            // ),
            BuildButton(
              text: '0',
              isLarge: true,
              onPressed: () {
                calculatorModel.addDisplay('0');
              },
            ),
            BuildButton(
              text: ',',
            ),
            BuildButton(
              color: Color(0xFFff9500),
              text: '=',
              onPressed: () {
                calculatorModel.getResult();
              },
            ),
          ],
        )
      ],
    );
  }
}
