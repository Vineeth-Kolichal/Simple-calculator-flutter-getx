import 'package:calculator/view/home_screen.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({
    super.key,
    required this.operator,
  });
  final String operator;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        homeController.addToExpression(operator);
      },
      child: SizedBox(
        height: 60,
        width: size.width * 0.2,
        child: Center(
          child: Text(
            operator,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
