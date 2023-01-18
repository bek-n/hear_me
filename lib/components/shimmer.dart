import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../style/style.dart';

class ShimmerHome extends StatefulWidget {
  const ShimmerHome({
    super.key,
  });

  @override
  State<ShimmerHome> createState() => _ShimmerHomeState();
}

class _ShimmerHomeState extends State<ShimmerHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Playlists',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  'See all',
                  style: Style.textStyleSeeAll(),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            height: 170,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 24),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => Column(
                      children: [
                        Shimmer(
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 12,
                            ),
                            height: 160.h,
                            width: 160.w,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 110, 108, 108),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                          ),
                        ),
                      ],
                    ))),
          ),
          32.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Popular Artists',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  'See all',
                  style: Style.textStyleSeeAll(),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            height: 190,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 24),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: ((context, index) => Column(
                      children: [
                        ClipOval(
                          child: Shimmer(
                            child: Container(
                              height: 160,
                              width: 160,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 110, 108, 108),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          32.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Top 200 songs',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  'See all',
                  style: Style.textStyleSeeAll(),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            height: 170,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 24),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => Column(
                      children: [
                        Shimmer(
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 12,
                            ),
                            height: 160.h,
                            width: 160.w,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 110, 108, 108),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                          ),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
