import 'package:flutter/material.dart';

class InputStore extends ChangeNotifier {
  late String _initialInvestment;
  late String _interestRate;
  late String _years;
  late String _contribution;
  String selectedPeriodCon = 'monthly';
  final List<String> _contributionItems = ['monthly', 'semiannual', 'annual'];
  String selectedPeriodCap = 'monthly';
  final List<String> _capitalizationItems = ['monthly', 'three months', 'semiannual', 'annual'];
  String selectedCurrency = 'UAH';
  final List<String> _currencyItems = ['UAH', 'USD'];

  get initialInvestment => _initialInvestment;
  get interestRate => _interestRate;
  get yaears => _years;
  get contribution => _contribution;
  get contributionItems => _contributionItems;
  get capitalizationItems => _capitalizationItems;
  get currencyItems => _currencyItems;

  set initialInvestment(value) {
    _initialInvestment = value;
    notifyListeners();
  }
  set interestRate(value) {
    _interestRate = value;
    notifyListeners();
  }
  set years(value) {
    _years = value;
    notifyListeners();
  }
  set contribution(value) {
    _contribution = value;
    notifyListeners();
  }
}