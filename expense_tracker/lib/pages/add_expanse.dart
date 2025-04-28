import 'package:expense_tracker/config/dummy_data.dart';
import 'package:expense_tracker/config/validator.dart';
import 'package:expense_tracker/controllers/expanse_controller.dart';
import 'package:expense_tracker/modals/category_modal.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:expense_tracker/widgets/dropdown.dart';
import 'package:expense_tracker/widgets/form_field.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNewExpanse extends StatefulWidget {
  const AddNewExpanse({super.key});

  @override
  State<AddNewExpanse> createState() => _AddNewExpanseState();
}

class _AddNewExpanseState extends State<AddNewExpanse> {
  final TextEditingController amountController = TextEditingController();
  final FocusNode amountFocus = FocusNode();

  final TextEditingController dateController = TextEditingController();
  final FocusNode dateFocus = FocusNode();

  final firstDate = DateTime.now().subtract(Duration(days: 100));
  final lastDate = DateTime.now();
  DateTime initialDate = DateTime.now();

  final ExpanseController expanseController = Get.find<ExpanseController>();

  ExpanseCategoryModal? selectedCategory;

  final formValidate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Add new expanse', size: 16, weight: FontWeight.w500),
      ),
      floatingActionButton: CustomButton(
          onPressed: () async {
            if (formValidate.currentState!.validate()) {
              await expanseController.addExpanse(
                  amountController.text, initialDate, selectedCategory!);

              amountController.clear();
              Navigator.pop(context);
            }
          },
          title: "Add new"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Form(
          key: formValidate,
          child: Column(
            children: [
              CustomTextFormField(
                controller: amountController,
                focus: amountFocus,
                keyboardType: TextInputType.number,
                label: "Enter Amount",
                validator: (value) => Validators.requriedField(value),
                onEditingComplete: () {
                  amountFocus.unfocus();
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: dateController,
                focus: dateFocus,
                enabled: false,
                label: "Pick date",
                validator: (value) => Validators.requriedField(value),
                onTap: () async {
                  dateFocus.unfocus();
                  DateTime? pickedTime = await showDatePicker(
                      context: context,
                      firstDate: firstDate,
                      lastDate: lastDate,
                      initialDate: initialDate);

                  if (pickedTime != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedTime);
                    initialDate = pickedTime;
                    dateController.text = formattedDate;
                  }
                },
              ),
              SizedBox(height: 20),
              CustomDropdown(
                label: "Choose Catagory",
                items: categories,
                validator: (value) => Validators.requriedField(value),
                onChanged: (p0) {
                  selectedCategory =
                      categories.firstWhere((element) => element.id == p0);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
