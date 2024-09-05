//import 'package:deposite_calculator/models/dropdown_model.dart';
import 'dart:math';
import 'package:deposite_calculator/models/dropdown_model.dart';
import 'package:deposite_calculator/models/input_model.dart';
import 'package:deposite_calculator/screen/result.dart';
import 'package:deposite_calculator/shared/styled_button.dart';
import 'package:deposite_calculator/shared/styled_text.dart';
import 'package:flutter/material.dart';

class MainData extends StatefulWidget {
  const MainData({super.key});

  @override
  State<MainData> createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  
  final _initialInvestment = TextEditingController();
  final _interestRate = TextEditingController();
  final _years = TextEditingController();
  final _months = TextEditingController();
  final _contribution = TextEditingController();
  String selectedPeriodCon = 'monthly';
  List<String> contributionItems = ['monthly', 'semiannual', 'annual'];
  String selectedPeriodCap = 'monthly';
  List<String> capitalizationItems = ['monthly', 'three months', 'semiannual', 'annual'];
  String selectedCurrency = 'UAH';
  List<String> currencyItems = ['UAH', 'USD'];

  void updateCurrency(String? newValue) {
    if(newValue is String) {
      setState(() {
        selectedCurrency = newValue;
      });
    }
  }

  void updateContribution(String? newValue) {
    if(newValue is String) {
      setState(() {
        selectedPeriodCon = newValue;
      });
    }
  }

  void updateCapitaliztion(String? newValue) {
    if(newValue is String) {
      setState(() {
        selectedPeriodCap = newValue;
      });
    }
  }

  @override
  void dispose() {
    _initialInvestment.dispose();
    _interestRate.dispose();
    _years.dispose();
    _months.dispose();
    _contribution.dispose();
    super.dispose();
  }

  void handleSubmit() {
    double initialInvestment;
    double interestRate;
    double compoundFreq; 
    double years;
    double regContribution;
    double paymentFreq;
    if(_initialInvestment.text.trim().isEmpty) {
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const StyledText(text: 'input error'),
            content: const StyledText(text: 'Please enter the initial investment.'),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const StyledHeading(text: 'Close')),
            ],
          );
        },
      );
      return;
    } else {
      initialInvestment = double.parse(_initialInvestment.text);
    }
    if(_interestRate.text.trim().isEmpty) {
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const StyledText(text: 'input error'),
            content: const StyledText(text: 'Please enter the interest Rate.'),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const StyledHeading(text: 'Close')),
            ],
          );
        },
      );
      return;
    } else {
      interestRate = double.parse(_interestRate.text) / 100;
    }
    if(_contribution.text.trim().isEmpty) {
      regContribution = 0;
    } else {
      regContribution = double.parse(_contribution.text);
    }
    if(selectedPeriodCon == 'monthly') {
      paymentFreq = 12;
    } else if(selectedPeriodCon == 'semiannual') {
      paymentFreq = 2;
    } else if(selectedPeriodCon == 'annual') {
      paymentFreq = 1;
    } else {
      paymentFreq = 0;
    }
    if(_years.text.trim().isEmpty) {
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const StyledText(text: 'input error'),
            content: const StyledText(text: 'Please enter number of years.'),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const StyledHeading(text: 'Close')),
            ],
          );
        },
      );
      return;
    } else {
      years = double.parse(_years.text);
    }
    if(selectedPeriodCap == 'monthly') {
      compoundFreq = 12;
    } else if(selectedPeriodCap == 'three months') {
      compoundFreq = 4;
    } else if(selectedPeriodCap == 'semiannual') {
      compoundFreq = 2;
    } else {
      compoundFreq = 1;
    }
    num compoundFactor = pow((1 + interestRate / compoundFreq), compoundFreq * years);
    double amount = initialInvestment * compoundFactor;
    num contributionAmount = 0;
    for (int i = 1; i <= years * paymentFreq; i++) {
      contributionAmount += regContribution * pow((1 + interestRate / compoundFreq), compoundFreq * (years - i / paymentFreq));
    }
    double totalAmount = amount + contributionAmount;
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Result(totalAmount: totalAmount, contributionAmount: contributionAmount, amount: amount)));
    print('$amount $selectedCurrency');
    print('$contributionAmount $selectedCurrency');
    print('$totalAmount $selectedCurrency');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StyledTitle(text: 'main data'),
    //Currency
        DropdowmButtonModel(onChanged: updateCurrency, items: currencyItems,),
        const SizedBox(height: 10,),
    //Initial Investment
        TextInput(nameController: _initialInvestment, text: 'initial investment'),
        const SizedBox(height: 10,),
    //InterestRate
        TextInput(nameController: _interestRate, text: 'interest rate'),
        const SizedBox(height: 10,),
    //Investment Length
        const StyledText(text: 'investment length'),
        Row(
          children: [
            const SizedBox(height: 10,),
            Expanded(child: TextInput(nameController: _years, text: 'years')),
            const SizedBox(width: 10),
            Expanded(child: TextInput(nameController: _months, text: 'month'))
          ]
        ),
    //Regular Contribution
        TextInput(nameController: _contribution, text: 'regular contribution'),
        const SizedBox(height: 5,),
        const StyledText(text: 'Period of contribution'),
        const SizedBox(height: 0,),
    //Period of Contribution
        DropdowmButtonModel(items: contributionItems, onChanged: updateContribution),
    //Capitalization
        const StyledText(text: 'capitalization'),
        const SizedBox(height: 10,),
        DropdowmButtonModel(items: capitalizationItems, onChanged: updateCapitaliztion),
        const SizedBox(height: 20,),
    //Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StyledButton(
                onPressed: handleSubmit,
                child: const StyledTitle(text: 'calculate')
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: StyledButton(
                onPressed: () {},
                child: const StyledTitle(text: 'clear')
              ),
            )
          ],
        )
      ],
    );
  }
}