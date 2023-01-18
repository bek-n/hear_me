import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/Auth/starting_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/G.png'), fit: BoxFit.contain)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 25),
                  child: RichText(
                      text: const TextSpan(
                          text: 'Listen to the best music everyday with ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Hearme',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 35,
                                color: Color(0xff06C149))),
                        TextSpan(
                            text: ' now',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 35)),
                      ])),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: ((context) => const StartPage())),
                          (route) => false);
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 24,
                                color: Color(0xff06C149),
                                offset: Offset(4, 0))
                          ],
                          color: Color(0xff06C149),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: const Center(
                          child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
