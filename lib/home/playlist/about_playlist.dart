import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/model/playlist.dart';
import 'package:hear_me/style/style.dart';

class PlaylistInfos extends StatefulWidget {
  final Playlist? infoplay;
  PlaylistInfos({super.key, required this.infoplay});

  @override
  State<PlaylistInfos> createState() => _PlaylistInfosState();
}

class _PlaylistInfosState extends State<PlaylistInfos> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 799,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.red,
                      Color.fromARGB(255, 123, 25, 18),
                    ])),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 152.h,
                      width: 152.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${widget.infoplay?.images?[index]?.url}'),
                            fit: BoxFit.cover),
                        color: Colors.white,
                      ),
                    ),
                    5.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.infoplay?.name}',
                          style: TextStyle(
                              color: Style.whiteColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        5.verticalSpace,
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          '${widget.infoplay?.description?.substring(58, 120)}',
                          style:
                              TextStyle(fontSize: 8, color: Style.whiteColor),
                        ),
                        5.verticalSpace,
                        Text(
                          '${widget.infoplay?.tracks?.total} tracks',
                          style: TextStyle(
                              color: Style.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              15.verticalSpace,
              Row(
                children: [
                  10.horizontalSpace,
                  Text(
                    '#',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  25.horizontalSpace,
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  60.horizontalSpace,
                  Text(
                    'Album',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  50.horizontalSpace,
                  Text(
                    'Added Date',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  20.horizontalSpace,
                  Text(
                    '🕑',
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: ((context, index) => Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              height: 80.h,
                              width: 380.w,
                              color: Style.whiteColor,
                            )
                          ],
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
