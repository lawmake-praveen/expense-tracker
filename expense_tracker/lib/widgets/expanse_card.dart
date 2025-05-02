import 'package:expense_tracker/config/colors.dart';
import 'package:expense_tracker/modals/expanse_modal.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpanseCard extends StatelessWidget {
  final ExpanseModal expanse;
  const ExpanseCard({super.key, required this.expanse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: ColorGet.bg2, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "${expanse.amount}", size: 18, weight: FontWeight.w500,),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "${expanse.category.name}"),
              CustomText(
                  text:
                      "${DateFormat('dd-MM-yyyy').format(expanse.datetime)}")
            ],
          ),
        ],
      ),
    );
  }
}
