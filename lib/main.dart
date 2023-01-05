import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/store/local.dart';
import 'package:hear_me/style/style.dart';

import 'home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  bool isChangeTheme = true;
  @override
  void initState() {
    getTheme();
    super.initState();
  }

  getTheme() async {
    isChangeTheme = await LocalStore.getTheme();

    setState(() {});
  }

  void change() {
    isChangeTheme = !isChangeTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isChangeTheme ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(
              
              scaffoldBackgroundColor: Style.whiteColor,
              appBarTheme: AppBarTheme(
                backgroundColor: Style.primaryColor,
                titleTextStyle: Style.textStyleNormal(
                  textColor: Style.blackColor,
                  size: 24,
                ),
              ),
              textTheme: TextTheme(
                  headline1: Style.textStyleNormal(
                    size: 48,
                    textColor: Style.blackColor,
                  ),
                  headline4: TextStyle(
                      color: Color(0xff9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  headline2: Style.textStyleNormal(
                      size: 16, textColor: Style.blackColor),
                  headline3: TextStyle(
                      fontSize: 18,
                      color: Style.blackColor,
                      fontWeight: FontWeight.w600)),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  headline1: Style.textStyleNormal(
                      size: 48, textColor: Style.whiteColor),
                  headline2: Style.textStyleNormal(
                    size: 16,
                    textColor: Style.whiteColor,
                  ),
                  headline3: TextStyle(
                      fontSize: 18,
                      color: Style.whiteColor,
                      fontWeight: FontWeight.w600),
                  headline4: TextStyle(
                      color: Style.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              scaffoldBackgroundColor: Style.darkModeColor,
              appBarTheme: AppBarTheme(
                backgroundColor: Style.primaryColor,
                titleTextStyle: Style.textStyleNormal(
                  textColor: Style.whiteColor,
                  size: 24,
                ),
              ),
            ),
            home: const SplashScreen(),
          );
        }));
  }
}
