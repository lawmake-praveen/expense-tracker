import 'package:expense_tracker/modals/category_modal.dart';

class ExpanseModal {
  final int id;
  final int amount;
  final ExpanseCategoryModal category;
  final DateTime datetime;

  ExpanseModal(
      {required this.id, required this.amount, required this.category, required this.datetime});
}
