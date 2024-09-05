import 'package:deposite_calculator/screen/main_data/main_data.dart';
import 'package:deposite_calculator/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void handleData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: 'Deposit Calculator'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
          child: Column(
            children: [
              MainData(),
            ],
          ),
        ),
      ),
    );
  }
}