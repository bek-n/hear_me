import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/home/home_page.dart';
import 'package:hear_me/style/style.dart';

class PopularArtists extends StatefulWidget {
  const PopularArtists({Key? key}) : super(key: key);

  @override
  State<PopularArtists> createState() => _PopularArtistsState();
}

class _PopularArtistsState extends State<PopularArtists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgcolorOfApp,
      appBar: AppBar(
        actions: [],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Text(
          "Popular Artists",
          style: TextStyle(color: Style.whiteColor),
        ),
        leadingWidth: 31.w,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 20),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                maxCrossAxisExtent: 215,
                mainAxisExtent: 210,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      width: 184.w,
                      height: 184.h,
                      decoration: BoxDecoration(
                          color: Style.whiteColor,
                          borderRadius: BorderRadius.circular(1000)),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
