import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorrre {
  LocalStorrre._();

  static setTheme(bool isLight) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setBool("theme", isLight);
  }

  static Future<bool> getTheme() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getBool("theme") ?? true;
  }

  static Future<List<String>> getSearch() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("title") ?? [];
    return list;
  }

  static setSearch(String title) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("title") ?? [];
    list.add(title);
    store.setStringList("title", list);
  }

  static removeSearch(String title) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('title') ?? [];
    list.removeWhere((element) => element == title);
    store.setStringList('title', list);
  }
}
