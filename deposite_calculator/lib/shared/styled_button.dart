import 'package:deposite_calculator/theme.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.child});
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.secondaryColor.withOpacity(0.7), AppColors.successColor.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
/* ElevatedButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColoros.secondaryColor.withOpacity(0.7), AppColoros.successColor.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: child,
      )
    );
    */