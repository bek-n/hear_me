import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorrre{
   LocalStorrre._();


    static setTheme(bool isLight) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setBool("theme", isLight);
  }

  static Future<bool> getTheme() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getBool("theme") ?? true;
  }
}