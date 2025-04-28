import 'package:expense_tracker/controllers/expanse_controller.dart';
import 'package:expense_tracker/pages/expanse_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ExpanseController expanseController = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Expanse tracker",
      home: ExpanseHistoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
