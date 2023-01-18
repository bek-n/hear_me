import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../style/style.dart';

class ShimmerPop extends StatelessWidget {
  const ShimmerPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 300,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 110, 108, 108),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      15.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width: 200,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Color.fromARGB(255, 110, 108, 108),
                            ),
                          ),
                          10.verticalSpace,
                          Container(
                            height: 4,
                            width: 100,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Color.fromARGB(255, 110, 108, 108),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.play_circle,
                        color: Style.primaryColor,
                      ),
                      5.horizontalSpace,
                      const Icon(
                        Icons.menu,
                        color: Style.primaryColor,
                      )
                      // svg
                      // icon
                    ],
                  ),
                );
              })),
    );
  }
}
