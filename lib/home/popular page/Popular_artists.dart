import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/home/home_page.dart';
import 'package:hear_me/home/popular%20page/popular_info.dart';
import 'package:hear_me/model/artists.dart';
import 'package:hear_me/style/style.dart';

class PopularArtists extends StatefulWidget {
  final Artists? art;
  PopularArtists({Key? key, required this.art}) : super(key: key);

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
              itemCount: widget.art?.artists?.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                maxCrossAxisExtent: 250,
                mainAxisExtent: 240,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Page35(info: widget.art,))));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: 184.w,
                        height: 184.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${widget.art?.artists?[index]?.images?[index]?.url}')),
                            color: Style.whiteColor,
                            borderRadius: BorderRadius.circular(1000)),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      '${widget.art?.artists?[index]?.name}',
                      style: Theme.of(context).textTheme.headline3,
                    )
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
