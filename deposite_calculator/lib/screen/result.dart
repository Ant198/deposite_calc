import 'dart:math';
import 'package:deposite_calculator/models/styled_text.dart';
import 'package:deposite_calculator/services/input_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {
  const Result({super.key});
  static late String _text;
  num getCompoundFactor(interestRate, compoundFreq, years) {
    return pow((1 + interestRate! / compoundFreq), compoundFreq * years!);
  }
  double getAmount(initialInvestment, compoundFactor) {
    return initialInvestment * compoundFactor;
  }
  num getContributionAmount(years, paymentFreq, regContribution, interestRate, compoundFreq) {
    num amount = 0;
    for (int i = 1; i <= years * paymentFreq; i++) {
      amount += regContribution * pow((1 + interestRate / compoundFreq), compoundFreq * (years - i / paymentFreq));
    }
    return amount;
  }
  double getTotalAmount(amount, contributionAmount) {
    return amount + contributionAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Consumer<InputStore>(
          builder: (context, inputItem, child) {
            num compoundFactor = getCompoundFactor(inputItem.interestRate, inputItem.compoundFreq, inputItem.years);
            double amount = getAmount(inputItem.getInitialInvestment, compoundFactor);
            num contributionAmount = getContributionAmount(inputItem.years, inputItem.paymentFreq, inputItem.contribution, inputItem.interestRate, inputItem.compoundFreq);
            double totalAmount = amount + contributionAmount;
            _text = 'Result: ${totalAmount.toStringAsFixed(2)}';
            return StyledText(text: _text);
          },
        ),
      )
    );
  }
}
/*
num compoundFactor = pow((1 + interestRate! / compoundFreq), compoundFreq * years!);
    double amount = initialInvestment! * compoundFactor;
    num contributionAmount = 0;
    for (int i = 1; i <= years * paymentFreq; i++) {
      contributionAmount += regContribution * pow((1 + interestRate / compoundFreq), compoundFreq * (years - i / paymentFreq));
    }
    double totalAmount = amount + contributionAmount;
*/
