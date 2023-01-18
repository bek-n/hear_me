import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/model_start_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController passw = TextEditingController();
  bool visibilityOfpasswor = false;
  bool value = false;
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;

  @override
  void dispose() {
    email.dispose();
    passw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            43.4.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 164),
              child: Image.asset(
                'assets/images/Logo.png',
                height: 86.67,
                width: 86.67,
              ),
            ),
            43.4.verticalSpace,
            const Text(
              'Login to Your Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            43.4.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                onChanged: (value) {
                  isEmailEmpty = false;
                  setState(() {});
                },
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFAFAFA),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff06C149)),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFAFAFA)),
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
            ),
            43.4.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                onChanged: (value) {
                  isPasswordEmpty = false;
                  setState(() {});
                },
                controller: passw,
                obscureText: visibilityOfpasswor,
                obscuringCharacter: '*',
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (() {
                          setState(() {
                            visibilityOfpasswor = !visibilityOfpasswor;
                          });
                        }),
                        icon: Icon(visibilityOfpasswor
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    filled: true,
                    fillColor: const Color(0xffFAFAFA),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff06C149)),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFAFAFA)),
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        width: 2.3,
                        color: Color(0xff06C149),
                      ),
                    ),
                    activeColor: const Color(0xff06C149),
                    value: this.value,
                    onChanged: ((value) {
                      setState(() {
                        this.value = value!;
                      });
                    })),
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  if (email.text.isEmpty) {
                    isEmailEmpty = true;
                  } else if (passw.text.isEmpty) {
                    isPasswordEmpty = true;
                  }
                  setState(() {});
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  decoration: BoxDecoration(
                      color: email.text.isEmpty || passw.text.isEmpty
                          ? const Color.fromARGB(255, 138, 234, 172)
                          : const Color(0xff06C149),
                      borderRadius: const BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Text('Sign up',
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ),
            43.4.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 96,
                  child: Divider(
                    color: Color(0xffEEEEEE),
                    thickness: 1.5,
                  ),
                ),
                16.horizontalSpace,
                Text(
                  'or continue with',
                  style: Theme.of(context).textTheme.headline3,
                ),
                16.horizontalSpace,
                const SizedBox(
                  width: 96,
                  child: Divider(
                    color: Color(0xffEEEEEE),
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Container(
                                height: 60.h,
                                width: 88.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(16)),
                                    border:
                                        Border.all(color: const Color(0xffEEEEEE))),
                                child: Center(
                                  child: Image.asset(
                                    items[index].image,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 109),
              child: Row(
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(
                        color: Color(0xff9E9E9E), fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: ((context) => SignUpPage())));
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
