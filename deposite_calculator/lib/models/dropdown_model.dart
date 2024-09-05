import 'package:deposite_calculator/shared/styled_text.dart';
import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';

class DropdowmButtonModel extends StatefulWidget {
  const DropdowmButtonModel({required this.items ,required this.onChanged ,super.key});
  final Function(String) onChanged;
  final List<String> items;

  @override
  State<DropdowmButtonModel> createState() => _DropdowmButtonModelState();
}

class _DropdowmButtonModelState extends State<DropdowmButtonModel> {
  late String selectedItem;

  @override
  void initState(){
    super.initState();
    selectedItem = widget.items[0];
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(5),
      dropdownColor: AppColors.highlightColor,
      focusColor: AppColors.secondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      items: widget.items.map((String value) => 
         DropdownMenuItem(
          value: value,
          child: StyledText(text: value,),
        )
      ).toList(),
      onChanged: (String? newValue) {
        if(newValue != null) {
          selectedItem = newValue;
          widget.onChanged(newValue);
        }
      },
      value: selectedItem,
      isExpanded: true,
    );
  }
}