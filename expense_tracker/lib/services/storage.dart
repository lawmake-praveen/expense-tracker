import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String savetext = 'expanses';

  static saveToLocal(Map<String, dynamic> expanse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existedExpanses = await getLocalExpanses();
    existedExpanses ??= [];
    String json = jsonEncode(expanse);
    existedExpanses.add(json);

    var newList = prefs.setStringList(savetext, existedExpanses);
  }

  static Future<List<String>?> getLocalExpanses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedExpanses = prefs.getStringList(savetext);
    print("saved expanses : ${savedExpanses}");
    return savedExpanses;
  }
}
