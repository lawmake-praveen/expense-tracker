import 'package:expense_tracker/config/colors.dart';
import 'package:expense_tracker/modals/category_modal.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<ExpanseCategoryModal> items;
  final void Function(dynamic)? onChanged;
  final String label;
  final String? Function(dynamic)? validator;
  const CustomDropdown({super.key, required this.items, this.onChanged, required this.label, this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items
          .map<DropdownMenuItem>((e) => DropdownMenuItem(
                child: CustomText(text: e.name),
                value: e.id,
              ))
          .toList(),
      onChanged: onChanged,
      // value: items[0].id,
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
