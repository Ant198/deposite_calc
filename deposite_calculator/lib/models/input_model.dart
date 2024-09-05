import 'package:deposite_calculator/shared/styled_text.dart';
import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  const TextInput({required this.nameController, required this.text, super.key});
  final TextEditingController nameController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.secondaryColor.withOpacity(0.7), AppColors.secondaryColor.withOpacity(0.5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: TextField(
            controller: nameController,
            cursorColor: AppColors.textColor,
            style: GoogleFonts.arimo(
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            decoration: InputDecoration(
              label: StyledHeading(text: text),
              
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ]
    );
  }
}