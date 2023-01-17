import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hear_me/style/style.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgcolorOfApp,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Text("Playlist"),
        leadingWidth: 31.w,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 20),
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 1,
                crossAxisSpacing: 0,
                maxCrossAxisExtent: 220,
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
