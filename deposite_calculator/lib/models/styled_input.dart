import 'package:deposite_calculator/models/styled_text.dart';
import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatefulWidget {
  const TextInput({required this.nameController, required this.text, super.key});
  final TextEditingController nameController;
  final String text;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  void clearText() {
    widget.nameController.clear();
  }
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
          child: TextFormField(
            controller: widget.nameController,
            cursorColor: AppColors.textColor,
            style: GoogleFonts.arimo(
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            decoration: InputDecoration(
              label: StyledHeading(text: widget.text),
              focusColor: AppColors.highlightColor,
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: AppColors.textColor, size: 15),
                onPressed: clearText,
              )
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 10,)
      ]
    );
  }
}