import 'package:flutter/material.dart';

class InputStore extends ChangeNotifier {
  late double _initialInvestment;
  late double _interestRate;
  late double _years;
  late double _contribution;
  late double _selectedPeriodCon;
  //final List<String> _contributionItems = ['monthly', 'semiannual', 'annual'];
  late double _selectedPeriodCap;
  //final List<String> _capitalizationItems = ['monthly', 'three months', 'semiannual', 'annual'];
  late String _selectedCurrency;
  late int _compoundFreq;
  late int _paymentFreq;
  //final List<String> _currencyItems = ['UAH', 'USD'];

  get getInitialInvestment => _initialInvestment;
  get interestRate => _interestRate;
  get years => _years;
  get contribution => _contribution;
  get selectedPeriodCon => _selectedPeriodCon;
  get selectedPeriodCap => _selectedPeriodCap;
  get selectedCurrency => _selectedCurrency;
  get compoundFreq => _compoundFreq;
  get paymentFreq => _paymentFreq;


  set initialInvestment(value) {
    print('3 - $value');
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
  set selectedPeriodCon(value) {
    _selectedPeriodCon = value;
    notifyListeners();
  }
  set selectedPeriodCap(value) {
    _selectedPeriodCap = value;
    notifyListeners();
  }
  set selectedCurrency(value) {
    _selectedCurrency = value;
    notifyListeners();
  }
  set compoundFreq(value) {
    _compoundFreq = value;
    notifyListeners();
  }
  set paymentFreq(value) {
    _paymentFreq = value;
    notifyListeners();
  }
}