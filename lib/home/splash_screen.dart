import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/Auth/starting_page.dart';
import 'package:hear_me/home/general_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local/local_store.dart';
import '../model/user_model.dart';
import 'on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    isLoading;

    Future.delayed(Duration(seconds: 4), () async {
      isLoading = false;

      // LocalStore local = LocalStore();
      // UserModel user = await local.getUser();

       SharedPreferences _store = await SharedPreferences.getInstance();
      String name = _store.getString('nickname') ?? '';

      if (name.isEmpty) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => StartPage())));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => GeneralPage())),
            (route) => false);
      }

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => OnBoardingPage())),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo.png',
                height: 60,
                width: 60,
              ),
              16.horizontalSpace,
              Text(
                'Hearme',
                style: TextStyle(fontSize: 48),
              )
            ],
          ),
          100.verticalSpace,
          isLoading
              ? LoadingAnimationWidget.hexagonDots(
                  color: Colors.green, size: 60)
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
