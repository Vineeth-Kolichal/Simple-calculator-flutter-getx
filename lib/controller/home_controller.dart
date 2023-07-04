import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString expression = ''.obs;
  RxString answer = ''.obs;
  void addToExpression(String value) {
    expression.value = expression.value + value;
  }

  void backSpace() {
    if (expression.value.length > 1) {
      expression.value = expression.substring(0, expression.value.length - 1);
    } else {
      expression.value = '';
    }
  }

  void evaluateExpression() {
    if (expression.value == '') {
      return;
    }
    List<dynamic> expList = [];
    List<String> operators = [];
    List<int> operands = [];
    String value = '';
    for (var i = 0; i < expression.value.length; i++) {
      if (expression.value[i] == '+' ||
          expression.value[i] == '-' ||
          expression.value[i] == 'x' ||
          expression.value[i] == '/') {
        expList.add(expression.value[i]);
      } else {
        expList.add(int.parse(expression.value[i]));
      }
    }
    for (var j = 0; j < expList.length; j++) {
      if (expList[j].runtimeType == int) {
        value = value + expList[j].toString();
      } else {
        operands.add(int.parse(value));
        operators.add(expList[j]);
        value = '';
      }
    }
    operands.add(int.parse(value));
    int soln = operands[0];
    for (int k = 1; k < operands.length; k++) {
      switch (operators[k - 1]) {
        case '+':
          soln = soln + operands[k];
          break;
        case '-':
          soln = soln - operands[k];
          break;
        case 'x':
          soln = soln * operands[k];
          break;
        case '/':
          soln = soln ~/ operands[k];
          break;
        default:
          break;
      }
    }
    answer.value = soln.toString();
  }

  void clearValues() {
    expression.value = '';
    answer.value = '';
  }
}
