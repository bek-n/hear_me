import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString('nickname') ?? '';

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
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
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
