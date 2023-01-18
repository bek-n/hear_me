import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/Auth/sign_up.dart';

import '../model/model_start_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.25.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(
                'assets/images/spage.png',
                height: 200,
                width: 380,
              ),
            ),
            30.25.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Let’s you in',
                  style: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(
              height: 252,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 30.25),
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        width: 380.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffEEEEEE)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              items[index].image,
                              height: 30,
                              width: 30,
                            ),
                            12.horizontalSpace,
                            Text(
                              items[index].text,
                              style: Theme.of(context).textTheme.headline2,
                            )
                          ],
                        )))),
              ),
            ),
            34.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 155,
                  child: Divider(
                    color: Color(0xffEEEEEE),
                    thickness: 1.5,
                  ),
                ),
                16.horizontalSpace,
                Text(
                  'or',
                  style: Theme.of(context).textTheme.headline3,
                ),
                16.horizontalSpace,
                const SizedBox(
                  width: 155,
                  child: Divider(
                    color: Color(0xffEEEEEE),
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: const BoxDecoration(
                    color: Color(0xff06C149),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 24,
                          color: Color(0xff06C149),
                          offset: Offset(4, 0))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Center(
                  child: Text(
                    'Sign in with password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 109),
              child: Row(
                children: [
                  const Text(
                    'Don’t have an account?  ',
                    style: TextStyle(
                        color: Color(0xff9E9E9E), fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SignUpPage())));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Color(0xff06C149),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
