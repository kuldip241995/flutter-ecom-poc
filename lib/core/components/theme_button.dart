import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';

class ThemeButton extends StatelessWidget {
  ThemeButton({required this.colour, required this.title, this.onPressed});

  final Color colour;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colour,
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          title,
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14.0),
        ),
      ),
    );
  }
}
