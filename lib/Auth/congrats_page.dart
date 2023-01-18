import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../home/general_page.dart';


class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  bool isLoading = true;

  @override
  void initState() {
    isLoading;

    Future.delayed(const Duration(seconds: 4), () {
      isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => const GeneralPage())),
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
          Image.asset(
            'assets/images/cong.png',
            height: 173.h,
            width: 177.75.w,
          ),
          32.verticalSpace,
          Text(
            'Congratulations!',
            style: GoogleFonts.sourceSansPro(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: const Color(0xff06C149)),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 32),
            child: Text(
                'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                style: Theme.of(context).textTheme.headline2),
          ),
          100.verticalSpace,
          isLoading
              ? LoadingAnimationWidget.hexagonDots(
                  color: Colors.green, size: 60)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
