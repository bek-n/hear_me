import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: mainPages[currentIndex],
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: FancyBottomBar(
            selectedIndex: currentIndex,
            type: FancyType.FancyV2,
            items: [
              FancyItem(
                textColor: Color(0xff06C149),
                title: 'Home',
                icon: Icon(Icons.home),
              ),
              FancyItem(
                textColor: Color(0xff06C149),
                title: 'Explore',
                icon: Icon(Icons.explore),
              ),
              FancyItem(
                textColor: Color(0xff06C149),
                title: 'Library',
                icon: Icon(Icons.library_add),
              ),
              FancyItem(
                textColor: Color(0xff06C149),
                title: 'Profile',
                icon: Icon(Icons.person),
              ),
            ],
            onItemSelected: ((value) => setState(() {
                  currentIndex = value;
                }))));
  }
}
