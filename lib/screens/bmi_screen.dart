import 'package:calculator/widgets/horizontal_button.dart';
import 'package:calculator/widgets/textfield.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController weightTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 248, 251, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(247, 248, 251, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Color.fromRGBO(81, 158, 255, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextInput(
              labelText: "Height",
              hintText: "Enter Your Height in meters",
              controller: heightTextController,
            ),
            const SizedBox(height: 20),
            CustomTextInput(
              labelText: "Weight",
              hintText: "Enter Your Weight in kg",
              controller: weightTextController,
            ),
            const SizedBox(height: 100),
            HorizontalButton(
              text: "Calculate",
              onPressed: calculateBmi,
            ),
            const SizedBox(height: 40),
            Text(
              result,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    final double? height = double.tryParse(heightTextController.text.trim());
    final double? weight = double.tryParse(weightTextController.text.trim());

    if (height != null && weight != null) {
      final double bmi = weight / (height * height);
      setState(() {
        result = "Result: ${bmi.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "Enter Valid Values !";
      });
    }
  }
}
