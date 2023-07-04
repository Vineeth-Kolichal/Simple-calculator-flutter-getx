import 'package:calculator/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'widgets/number_button.dart';
import 'widgets/operator_button.dart';

const Widget verDivider = SizedBox(height: 60, child: VerticalDivider());
HomeController homeController = Get.put(HomeController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      homeController.expression.value,
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => Visibility(
                visible: homeController.answer.value != '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      homeController.answer.value,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    )
                  ],
                ))),
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '1',
              ),
              verDivider,
              NumberButton(number: '2'),
              verDivider,
              NumberButton(number: '3'),
              verDivider,
              OperatorButton(
                operator: '+',
              )
            ],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '4',
              ),
              verDivider,
              NumberButton(number: '5'),
              verDivider,
              NumberButton(number: '6'),
              verDivider,
              OperatorButton(
                operator: '-',
              )
            ],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '7',
              ),
              verDivider,
              NumberButton(number: '8'),
              verDivider,
              NumberButton(number: '9'),
              verDivider,
              OperatorButton(
                operator: 'x',
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  homeController.evaluateExpression();
                },
                child: SizedBox(
                  height: 60,
                  width: size.width * 0.2,
                  child: const Center(
                    child: Text(
                      '=',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ),
                ),
              ),
              verDivider,
              const NumberButton(number: '0'),
              verDivider,
              InkWell(
                onTap: () {
                  homeController.backSpace();
                },
                onLongPress: () {
                  homeController.clearValues();
                },
                child: SizedBox(
                  height: 60,
                  width: size.width * 0.2,
                  child: const Center(
                    child: Icon(
                      Icons.backspace_outlined,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              verDivider,
              const OperatorButton(
                operator: '/',
              )
            ],
          ),
        ],
      ),
    );
  }
}
