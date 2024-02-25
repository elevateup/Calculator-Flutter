import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isButtonColored;
  final bool istextColored;
  final bool isDisabled;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.isButtonColored,
    required this.istextColored,
    this.isDisabled = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isButtonColored
                ? const Color.fromRGBO(173, 226, 254, 1)
                : const Color.fromRGBO(251, 251, 253, 1),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: istextColored
                    ? isButtonColored
                        ? const Color.fromRGBO(81, 158, 255, 1)
                        : const Color.fromRGBO(94, 186, 254, 1)
                    : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
