import 'package:calculator/view/home_screen.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.number,
  });
  final String number;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        homeController.addToExpression(number);
      },
      child: SizedBox(
        height: 60,
        width: size.width * 0.2,
        child: Center(
          child: Text(
            number,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
