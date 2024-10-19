//import 'package:deposite_calculator/models/dropdown_model.dart';
import 'package:deposite_calculator/models/dropdown_model.dart';
import 'package:deposite_calculator/models/styled_input.dart';
import 'package:deposite_calculator/screen/result.dart';
import 'package:deposite_calculator/models/styled_button.dart';
import 'package:deposite_calculator/models/styled_text.dart';
import 'package:deposite_calculator/services/input_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainData extends StatefulWidget {
  const MainData({super.key});

  @override
  State<MainData> createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  final _keyForm = GlobalKey<FormState>();
  final _initialInvestment = TextEditingController();
  final _interestRate = TextEditingController();
  final _years = TextEditingController();
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
    _contribution.dispose();
    super.dispose();
  }

  void handleSubmit(updateData) {
    if (_keyForm.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: StyledText(text: 'Processing Data'))
      );
    }
    if(_initialInvestment.text.trim().isNotEmpty) {
      updateData.initialInvestment = double.parse(_initialInvestment.text);
    }
    if(_interestRate.text.trim().isNotEmpty) {
      updateData.interestRate = double.parse(_interestRate.text) / 100;
    }
    if(_contribution.text.trim().isEmpty) {
      updateData.contribution = 0;
    } else {
      updateData.contribution = double.parse(_contribution.text);
    }
    if(selectedPeriodCon == 'monthly') {
      updateData.paymentFreq = 12;
    } else if(selectedPeriodCon == 'semiannual') {
      updateData.paymentFreq = 2;
    } else if(selectedPeriodCon == 'annual') {
      updateData.paymentFreq = 1;
    } else {
      updateData.paymentFreq = 0;
    }
    if(_years.text.trim().isNotEmpty) {
      updateData.years = double.parse(_years.text);
    }
    if(selectedPeriodCap == 'monthly') {
      updateData.compoundFreq = 12;
    } else if(selectedPeriodCap == 'three months') {
      updateData.compoundFreq = 4;
    } else if(selectedPeriodCap == 'semiannual') {
      updateData.compoundFreq = 2;
    } else {
      updateData.compoundFreq = 1;
    }
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Result()));
  }

  void clearFields() {
    _initialInvestment.clear();
    _interestRate.clear();
    _years.clear();
    _contribution.clear();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InputStore>(context, listen: false);
    return Column(
      children: [
        const StyledTitle(text: 'main data'),
    //Currency
        DropdowmButtonModel(onChanged: updateCurrency, items: currencyItems,),
        const SizedBox(height: 10,),
        Form(
          key: _keyForm,
          child: Column(
            children: [
        //Initial Investment
              TextInput(nameController: _initialInvestment, text: 'initial investment'),
              const SizedBox(height: 10,),
        //InterestRate
              TextInput(nameController: _interestRate, text: 'interest rate'),
              const SizedBox(height: 10,),
        //Investment Length
              const StyledText(text: 'investment length'),
              const SizedBox(height: 10,),
              TextInput(nameController: _years, text: 'years'),
        //Regular Contribution
              TextInput(nameController: _contribution, text: 'regular contribution'),
            ],
          )
        ),
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
                onPressed: () => handleSubmit(provider),
                child: const StyledTitle(text: 'calculate')
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: StyledButton(
                onPressed: clearFields,
                child: const StyledTitle(text: 'clear')
              ),
            )
          ],
        )
      ],
    );
  }
}