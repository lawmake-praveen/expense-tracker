import 'package:expense_tracker/config/colors.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.all(16),
          height: 40,
          decoration: BoxDecoration(
              color: ColorGet.button1, borderRadius: BorderRadius.circular(6)),
          child: CustomText(
              text: title,
              color: ColorGet.text2,
              size: 16,
              weight: FontWeight.w500)),
    );
  }
}
