import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hear_me/style/style.dart';

import '../../model/playlist.dart';
import 'about_playlist.dart';

class PlayList extends StatefulWidget {
  final Playlist? playLists;
  const PlayList({Key? key, required this.playLists}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Text("Playlists"),
        leadingWidth: 31.w,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.playLists?.images?.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                maxCrossAxisExtent: 220,
                mainAxisExtent: 210,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((context) => PlaylistInfos(
                        //           infoplay: widget.playLists,
                        //         ))));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 12,
                        ),
                        height: 180.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${widget.playLists?.images?[index]?.url}'),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      '${widget.playLists?.name}',
                      style: Theme.of(context).textTheme.headline3,
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
