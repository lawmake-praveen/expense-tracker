import 'package:expense_tracker/config/colors.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final String label;
  final TextInputType keyboardType;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final bool? enabled;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.focus,
      required this.label,
      this.keyboardType = TextInputType.name,
      this.onEditingComplete,
      this.onTap,
      this.enabled,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focus,
      keyboardType: keyboardType,
      onTapOutside: (event) {
        focus.unfocus();
      },
      // enabled: enabled,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      cursorColor: ColorGet.stroke1,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGet.stroke1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGet.stroke1)),
          label: CustomText(text: label)),
    );
  }
}
