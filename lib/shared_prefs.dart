import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static String mostRecent = 'most_recently';
}

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo :get List
  List<String> mostRecentList =
      prefs.getStringList(SharedPrefsKeys.mostRecent) ?? [];
  //todo :add to  List
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  if (mostRecentList.length > 5) {
    mostRecentList = mostRecentList.sublist(0, 5);
  }
  //todo :save list
  await prefs.setStringList(SharedPrefsKeys.mostRecent, mostRecentList);
}
