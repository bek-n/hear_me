import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/style/style.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/profile.dart';
import '../../store/local.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      key: key,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: DayNightSwitcherIcon(
              dayBackgroundColor: Style.whiteColor,
              isDarkModeEnabled: !isChangedTheme,
              onStateChanged: (isDarkModeEnabled) {
                isChangedTheme = !isChangedTheme;
                MyApp.of(context)!.change();
                LocalStorrre.setTheme(isChangedTheme);
                setState(() {});
              },
            ),
          ),
        ],
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    height: 80.r,
                    width: 80.r,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://source.unsplash.com/random/1'),
                            fit: BoxFit.cover)),
                  ),
                  10.horizontalSpace,
                  Text(
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    ' 👋 Hello $name',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 380.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/prem.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(32)),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listOfProfile.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 17),
                          child: Row(
                            children: [
                              listOfProfile[index].icon1,
                              24.horizontalSpace,
                              Text(
                                listOfProfile[index].text,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Spacer(),
                              listOfProfile[index].icon2
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
