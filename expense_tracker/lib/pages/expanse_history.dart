import 'package:expense_tracker/config/colors.dart';
import 'package:expense_tracker/config/dummy_data.dart';
import 'package:expense_tracker/controllers/expanse_controller.dart';
import 'package:expense_tracker/modals/category_modal.dart';
import 'package:expense_tracker/modals/expanse_modal.dart';
import 'package:expense_tracker/pages/add_expanse.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:expense_tracker/widgets/dropdown.dart';
import 'package:expense_tracker/widgets/expanse_card.dart';
import 'package:expense_tracker/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpanseHistoryPage extends StatefulWidget {
  const ExpanseHistoryPage({super.key});

  @override
  State<ExpanseHistoryPage> createState() => _ExpanseHistoryPageState();
}

class _ExpanseHistoryPageState extends State<ExpanseHistoryPage> {
  final ExpanseController expanseController = Get.find<ExpanseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorGet.bg2,
        appBar: AppBar(
          title: CustomText(
              text: 'Expanse history', size: 16, weight: FontWeight.w500),
        ),
        floatingActionButton: CustomButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => AddNewExpanse()));
            },
            title: "Add new"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(() => expanseController.expanses.isEmpty
            ? Center(child: CustomText(text: "No expanses found"))
            : Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: ColorGet.bg3),
                      child: Column(
                        children: [
                          CustomText(
                            text: "Expanses",
                            weight: FontWeight.w300,
                            size: 20,
                            color: ColorGet.text2,
                          ),
                          CustomText(
                            text: "Expanses",
                            weight: FontWeight.w300,
                            color: ColorGet.text2,
                            size: 20,
                          ),
                          Container(
                            height: 350,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 30,
                                  decoration: BoxDecoration(color: ColorGet.bg5),
                                  child: Column(children: [

                                  ],),
                                );
                              },
                            ),
                          )
                        ],
                      )),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: expanseController.groupedExpanses.keys.length,
                      itemBuilder: (context, index) {
                        final category = expanseController.groupedExpanses.keys
                            .elementAt(index);
                        final expansesUnderCategory =
                            expanseController.groupedExpanses[category]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: '${category.name}',
                                weight: FontWeight.w300),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 20),
                              itemCount: expansesUnderCategory.length,
                              itemBuilder: (context, index) {
                                ExpanseModal expanse =
                                    expansesUnderCategory[index];
                                return ExpanseCard(expanse: expanse);
                              },
                            ),
                          ],
                        );
                      }),
                ],
              )));
  }
}
