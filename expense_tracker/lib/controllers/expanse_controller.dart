import 'package:expense_tracker/modals/category_modal.dart';
import 'package:expense_tracker/modals/expanse_modal.dart';
import 'package:expense_tracker/services/storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpanseController {
  RxList<ExpanseModal> expanses = RxList();
  RxMap<ExpanseCategoryModal, List<ExpanseModal>> groupedExpanses = RxMap();

  addExpanse(
      String amount, DateTime date, ExpanseCategoryModal category) async {
    ExpanseModal newExpanse = ExpanseModal(
        id: expanses.length + 1,
        amount: int.parse(amount),
        category: category,
        datetime: date);

    Map<String, dynamic> newExpanseJson = newExpanse.toJson();
    print("json : ${newExpanseJson}");
    expanses.add(newExpanse);
    await LocalStorageService.saveToLocal(newExpanseJson);
    groupByCategory();
  }

  groupByCategory() {
    groupedExpanses.value = RxMap();
    for (var expanse in expanses) {
      if (!groupedExpanses.containsKey(expanse.category)) {
        groupedExpanses[expanse.category] = [];
      }
      groupedExpanses[expanse.category]!.add(expanse);
    }
  }

  loadExpanses() async {
    List<String>? existedExpanses =
        await LocalStorageService.getLocalExpanses();
    print("existed expanses : ${existedExpanses}");
  }
}
