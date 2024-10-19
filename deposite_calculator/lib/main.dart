import 'package:deposite_calculator/screen/home.dart';
import 'package:deposite_calculator/services/input_store.dart';
import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => InputStore(),
      child:  MaterialApp(
        title: 'Deposite Calculator',
        theme: primeTheme,
        home: const Home(),
      )
    ),
  );
}

