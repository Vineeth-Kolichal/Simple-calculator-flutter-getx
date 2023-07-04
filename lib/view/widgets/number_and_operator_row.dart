import 'package:calculator/view/home_screen.dart';
import 'package:calculator/view/widgets/number_button.dart';
import 'package:calculator/view/widgets/operator_button.dart';
import 'package:flutter/material.dart';

class NumberAndOperatorRow extends StatelessWidget {
  const NumberAndOperatorRow({
    super.key,
    required this.first,
    required this.second,
    required this.third,
    required this.forth,
  });
  final String first;
  final String second;
  final String third;
  final String forth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberButton(
          number: first,
        ),
        verDivider,
        NumberButton(number: second),
        verDivider,
        NumberButton(number: third),
        verDivider,
        OperatorButton(
          operator: forth,
        )
      ],
    );
  }
}
