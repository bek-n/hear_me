// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/components/cachedNetworkImage.dart';

import '../../model/artistSongs.dart';
import '../../style/style.dart';

class SeeAll extends StatefulWidget {
  final Artistsongs? seeAll;
  SeeAll({super.key, required this.seeAll});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget
                    .seeAll?.data?.artist?.discography?.singles?.items?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageNetwork(
                            height: 80,
                            width: 80,
                            image:
                                '${widget.seeAll?.data?.artist?.discography?.singles?.items?[index]?.releases?.items?[0]?.coverArt?.sources?[0]?.url}'),
                        35.horizontalSpace,
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            '${widget.seeAll?.data?.artist?.discography?.singles?.items?[index]?.releases?.items?[0]?.name}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.play_circle,
                          color: Style.primaryColor,
                        ),
                        5.horizontalSpace,
                        Icon(
                          Icons.menu,
                          color: Style.primaryColor,
                        )
                        // svg
                        // icon
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
