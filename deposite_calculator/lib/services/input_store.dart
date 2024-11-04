import 'package:flutter/material.dart';

class InputStore extends ChangeNotifier {
  late double _initialInvestment;
  late double _interestRate;
  late double _years;
  late double _contribution;
  late double _selectedPeriodCon;
  late double _selectedPeriodCap;
  late String _selectedCurrency;
  late int _compoundFreq;
  late int _paymentFreq;

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