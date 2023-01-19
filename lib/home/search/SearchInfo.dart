import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hear_me/model/Search.dart';

import '../../style/style.dart';

class SearchArtistInfo extends StatefulWidget {
  final Search? se;
  final int indx;
  const SearchArtistInfo({super.key, required this.se, required this.indx});

  @override
  State<SearchArtistInfo> createState() => _SearchArtistInfoState();
}

class _SearchArtistInfoState extends State<SearchArtistInfo> {
  bool isLoading = true;

  @override
  void initState() {
    print(widget.se);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: 255,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${widget.se?.artists?.items?[widget.indx]?.data?.visuals?.avatarImage?.sources?.first?.url}'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
            ),
            Text(
              '${widget.se?.albums?.items?[widget.indx]?.data?.artists?.items?[0]?.profile?.name}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 24,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Icon(
                      Icons.playlist_add,
                      size: 24,
                      color: Style.primaryColor,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Icon(
                      Icons.download_outlined,
                      size: 24,
                      color: Style.primaryColor,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 112,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Row(
                      children: [
                        15.horizontalSpace,
                        const Icon(
                          Icons.play_circle_outline,
                          color: Style.whiteColor,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Play',
                          style: Theme.of(context).textTheme.headline3,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xff35383F),
              thickness: 0.5,
              indent: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Songs',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xff06C149),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  builder:
                      (BuildContext context, AsyncSnapshot<Search?> snapshot) {
                    return ListView.builder(
                        itemCount: widget.se?.albums?.items?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 300,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${widget.se?.albums?.items?[index]?.data?.coverArt?.sources?[0]?.url}',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                ),
                                15.horizontalSpace,
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    '${widget.se?.albums?.items?[index]?.data?.name}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
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
                              ],
                            ),
                          );
                        });
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
