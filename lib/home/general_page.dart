import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hear_me/home/search/Search_page.dart';

import 'package:hear_me/style/style.dart';
import 'Profile_page (1).dart';
import 'home_page.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<IndexedStackChild> mainPages = [
    IndexedStackChild(child: const HomePage()),
    IndexedStackChild(child: const SearchPage()),
    IndexedStackChild(child: const Placeholder()),
    IndexedStackChild(child: const ProfilePage()),
  ];
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProsteIndexedStack(
          index: currentIndex,
          children: mainPages,
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: CustomNavigationBar(
            scaleCurve: Curves.fastLinearToSlowEaseIn,
            iconSize: 27,
            selectedColor: Style.primaryColor,
            unSelectedColor: const Color(0xff9E9E9E),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            currentIndex: currentIndex,
            items: [
              CustomNavigationBarItem(
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline2,
                ),
                icon: const Icon(Icons.home),
              ),
              CustomNavigationBarItem(
                title: Text(
                  'Explore',
                  style: Theme.of(context).textTheme.headline2,
                ),
                icon: const Icon(Icons.explore),
              ),
              CustomNavigationBarItem(
                title: Text(
                  'Library',
                  style: Theme.of(context).textTheme.headline2,
                ),
                icon: const Icon(Icons.library_add),
              ),
              CustomNavigationBarItem(
                title: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headline2,
                ),
                icon: const Icon(Icons.person),
              ),
            ],
            onTap: ((value) => setState(() {
                  currentIndex = value;
                }))));
  }
}
