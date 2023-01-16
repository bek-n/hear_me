import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/store/local.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String name = '';
  bool isChangedTheme = true;
  GlobalKey<ScaffoldState> key = GlobalKey();

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString('nickname') ?? '';
     isChangedTheme = await LocalStorrre.getTheme();

    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RollingSwitch.icon(
              initialState: !isChangedTheme,
              onChanged: (s) {
                isChangedTheme = !isChangedTheme;
                MyApp.of(context)!.change();
                LocalStorrre.setTheme(isChangedTheme);
                setState(() {});
              },
              rollingInfoRight: const RollingIconInfo(
                icon: Icons.light_mode,
              ),
              rollingInfoLeft: const RollingIconInfo(
                icon: Icons.dark_mode,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 50.r,
              width: 50.r,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(''), fit: BoxFit.cover)),
            ),
            10.horizontalSpace,
            Text(
              ' 👋 Hello $name',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
