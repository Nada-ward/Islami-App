import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_prefs.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getLastSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //todo:get list from shared prefs as string
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecent) ?? [];
    //todo: chnage list type into int
    List<int> mostRecentListAsInt = mostRecentListAsString
        .map((e) => int.parse(e))
        .toList();
    mostRecentList = mostRecentListAsInt;
    notifyListeners();
  }
}
