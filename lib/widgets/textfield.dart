import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(81, 158, 255, 1),
        ),
        contentPadding: const EdgeInsets.all(18),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(81, 158, 255, 1)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: hintText,
      ),
    );
  }
}
