import 'package:calculator/screens/bmi_screen.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String userInput = "";
  String result = "";

  List<Map<String, Map<bool, bool>>> buttonList = [
    {
      "C": {false: false}
    },
    {
      "": {false: false}
    },
    {
      "←": {true: true}
    },
    {
      "÷": {true: true}
    },
    {
      "7": {false: true}
    },
    {
      "8": {false: true}
    },
    {
      "9": {false: true}
    },
    {
      "*": {true: true}
    },
    {
      "4": {false: true}
    },
    {
      "5": {false: true}
    },
    {
      "6": {false: true}
    },
    {
      "-": {true: true}
    },
    {
      "1": {false: true}
    },
    {
      "2": {false: true}
    },
    {
      "3": {false: true}
    },
    {
      "+": {true: true}
    },
    {
      "0": {false: true}
    },
    {
      "00": {false: true}
    },
    {
      ".": {false: true}
    },
    {
      "=": {true: true}
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<String> expressions = getExpressions();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 248, 251, 1),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Color.fromRGBO(129, 129, 129, 1),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: const TextStyle(
                        color: Color.fromRGBO(66, 66, 66, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return index == 1
                    ? CustomButton(
                        text: "BMI",
                        isButtonColored: false,
                        istextColored: true,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BMIScreen()));
                        },
                      )
                    : CustomButton(
                        text: buttonList[index].keys.first,
                        isButtonColored:
                            buttonList[index].values.first.keys.first,
                        istextColored:
                            buttonList[index].values.first.values.first,
                        onTap: () {
                          if (index == 0) {
                            // Handle Clear Key
                            setState(() {
                              userInput = "";
                              result = "";
                            });
                          } else if (index == 2) {
                            // Handle Back Key
                            if (userInput.isNotEmpty) {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            }
                          } else if (index == buttonList.length - 1) {
                            // Handle Evaluate Key
                            evaluate(userInput);
                          } else if (userInput.isEmpty &&
                              expressions
                                  .contains(buttonList[index].keys.first)) {
                            // Handle if Input is Empty and user tries to input expressions
                            return;
                          } else if (userInput.isNotEmpty &&
                              expressions
                                  .contains(userInput[userInput.length - 1]) &&
                              expressions
                                  .contains(buttonList[index].keys.first)) {
                            // Handle if user tries to input expression after expression
                            return;
                          } else if (index == buttonList.length - 2 && userInput.contains(".")) {
                            return;
                          } else {
                            setState(() {
                              userInput += buttonList[index].keys.first;
                            });
                          }
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void evaluate(String input) {
    if (input.isEmpty) return;
    input = input.replaceAll("÷", "/");
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    String eval = exp.evaluate(EvaluationType.REAL, cm).toString();

    if (eval.endsWith(".0")) {
      eval = eval.replaceAll(".0", "");
    }
    setState(() {
      result = "= $eval";
    });
  }

  List<String> getExpressions() {
    List<String> result = [];

    for (var i = 0; i < buttonList.length; i++) {
      if (buttonList[i].values.first.keys.first) {
        result.add(buttonList[i].keys.first);
      }
    }
    return result;
  }
}
