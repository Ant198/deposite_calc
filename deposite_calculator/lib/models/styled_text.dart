import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({required this.text,super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.arimo(
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.arimo(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.arimo(
        textStyle: Theme.of(context).textTheme.titleMedium,
        color: AppColors.textColor
      ),
    );
  }
}