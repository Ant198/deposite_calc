import 'package:deposite_calculator/models/styled_text.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({required this.totalAmount, required this.contributionAmount, required this.amount ,super.key});
  final double totalAmount;
  final num contributionAmount;
  final double amount;
  static String? _text;

  @override
  Widget build(BuildContext context) {
    _text = 'Result: ${totalAmount.toStringAsFixed(2)}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: StyledText(text: _text!),
      )
    );
  }
}