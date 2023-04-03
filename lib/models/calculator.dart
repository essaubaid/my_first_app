import 'dart:collection';

import 'package:flutter/cupertino.dart';

class CalculatorModel extends ChangeNotifier {
  final Queue _queue = Queue.of(<dynamic>[0]);
  dynamic operator;
  dynamic previousOperator;
  String display = '0';
  bool isResult = false;
  bool isOperator = false;
  bool isPreResult = false;

  Queue get getQueue => _queue;

  void add(dynamic value) {
    _queue.length > 1 ? _queue.removeFirst() : null;
    _queue.add(double.parse(display));
  }

  void resetOperator() {
    isOperator = false;
    previousOperator = operator;
    operator = null;
  }

  void setOperator(dynamic operator) {
    if (isOperator) {
      isOperator = true;
      add(double.parse(display));
      double result = performCalculation();
      _queue.removeFirst();
      _queue.addLast(result);
      setDisplay(result);
      isPreResult = true;
      print(_queue);
    } else {
      this.operator = operator;
      isOperator = true;
      isResult ? isResult = false : null;
      add(display);
      resetDisplay();
    }
  }

  double performCalculation() {
    double result = 0;
    if (operator == '+') {
      result = _queue.first + _queue.last;
    } else if (operator == '-') {
      result = _queue.first - _queue.last;
    } else if (operator == 'x') {
      result = _queue.first * _queue.last;
    } else if (operator == '/') {
      result = _queue.first / _queue.last;
    }
    return result;
  }

  void getResult() {
    if (isResult) {
      operator = previousOperator;
      _queue.removeFirst();
      _queue.addFirst(double.parse(display));
      double result = performCalculation();
      setDisplay(result);
      print(_queue);
      isResult = true;
    } else {
      add(display);
      double result = performCalculation();
      setDisplay(result);
      print(_queue);
      isResult = true;
    }
    resetOperator();
  }

  void incremnet() {
    _queue.add(_queue.last + 1);
    _queue.removeFirst();
    notifyListeners();
  }

  void input(String value) {
    if (_queue.last == 0) {
      _queue.removeLast();
      _queue.add(double.parse(value));
    } else {
      print(_queue.last);
      double tem = _queue.removeLast();
      String test = tem.truncateToDouble() == tem
          ? tem.toStringAsFixed(0)
          : tem.toString();
      _queue.add(double.parse(test + value));
      print('bofre operator ${test}');
      print(_queue.last);
    }
    notifyListeners();
  }

  void setDisplay(dynamic value) {
    display = value.toString();
    notifyListeners();
  }

  void addDisplay(dynamic value) {
    if (display == '0') {
      setDisplay(value);
    } else if (isPreResult) {
      resetDisplay();
      display = value.toString();
      isResult = false;
      isPreResult = false;
      notifyListeners();
    } else if (isResult) {
      resetDisplay();
      resetQueue();
      isResult = false;
      display = value.toString();
      notifyListeners();
    } else {
      display = display + value.toString();
      notifyListeners();
    }
  }

  void resetDisplay() {
    display = '0';
    notifyListeners();
  }

  void clearAll() {
    resetDisplay();
    resetQueue();
    resetOperator();
    isPreResult = false;
    isOperator = false;
    isResult = false;
  }

  void resetQueue() {
    _queue.clear();
    _queue.add(0);
  }
}

  // void getResult() {
  //   double result;
  //   //for testing
  //   isResult ? null : add(display);

  //   if (operator == '+') {
  //     result = _queue.first + _queue.last;
  //     setDisplay(result);
  //     if (isResult) {
  //       _queue.removeLast();
  //     }
  //     _queue.length > 1 ? _queue.removeFirst() : null;
  //     add(result);
  //     isResult = true;
  //     print(_queue);
  //   } else if (operator == '-') {
  //     _queue.add(_queue.first - _queue.last);
  //     _queue.removeFirst();
  //     notifyListeners();
  //   } else if (operator == 'x') {
  //     _queue.add(_queue.first * _queue.last);
  //     _queue.removeFirst();
  //     notifyListeners();
  //   } else if (operator == '/') {
  //     _queue.add(_queue.first / _queue.last);
  //     _queue.removeFirst();
  //     notifyListeners();
  //   }
  // }

    // void setOperator(dynamic operator) {
  //   if (isOperator) {
  //     isOperator = true;
  //     add(double.parse(display));
  //     double result = performCalculation();
  //     _queue.removeFirst();
  //     _queue.addLast(result);
  //     setDisplay(result);
  //     isPreResult = true;
  //     print(_queue);
  //   } else {
  //     this.operator = operator;
  //     isOperator = true;
  //     isResult ? isResult = false : null;
  //     add(display);
  //     resetDisplay();
  //   }
  // }

  //  void addDisplay(dynamic value) {
  //   if (display == '0') {
  //     setDisplay(value);
  //   } else if (isPreResult) {
  //     resetDisplay();
  //     notifyListeners();
  //     display = value.toString();
  //     isResult = false;
  //     isPreResult = false;
  //   } else if (isResult) {
  //     resetDisplay();
  //     resetQueue();
  //     isResult = false;
  //     display = value.toString();
  //     notifyListeners();
  //   } else {
  //     display = display + value.toString();
  //     notifyListeners();
  //   }
  // }
