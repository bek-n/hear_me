// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/components/cachedNetworkImage.dart';
import 'package:hear_me/model/top200.dart';

class TopInfo extends StatefulWidget {
  final List<Top200?>? top;
  const TopInfo({super.key, required this.top});

  @override
  State<TopInfo> createState() => _TopInfoState();
}

class _TopInfoState extends State<TopInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.top?[1]?.trackMetadata?.displayImageUri?.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 10,
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
                        child: CustomImageNetwork(
                            height: 180,
                            width: 180,
                            image:
                                '${widget.top?[index]?.trackMetadata?.displayImageUri}')),
                    5.verticalSpace,
                    Expanded(
                      child: Text(
                        '${widget.top?[index]?.trackMetadata?.trackName}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
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
