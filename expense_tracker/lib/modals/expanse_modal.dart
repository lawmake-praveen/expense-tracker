import 'package:expense_tracker/modals/category_modal.dart';

class ExpanseModal {
  final int id;
  final int amount;
  final ExpanseCategoryModal category;
  final DateTime datetime;

  ExpanseModal(
      {required this.id,
      required this.amount,
      required this.category,
      required this.datetime});

  factory ExpanseModal.fromJson(Map<String, dynamic> json) {
    return ExpanseModal(
        id: json['id'],
        amount: json['amount'],
        category: json['category'],
        datetime: json['datetime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'int': amount,
      'category': category.id,
      'datetime': datetime.toIso8601String()
    };
  }
}
