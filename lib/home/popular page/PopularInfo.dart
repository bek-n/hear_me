import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/home/popular%20page/popularSeeAll.dart';
import 'package:hear_me/model/artists.dart';
import 'package:hear_me/style/style.dart';

import '../../components/shimmer_popular.dart';
import '../../model/artistSongs.dart';
import '../../repository/get_info.dart';

class Page35 extends StatefulWidget {
  final Artists? info;

  Page35({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<Page35> createState() => _Page35State();
}

class _Page35State extends State<Page35> {
  Artistsongs? songs;
  bool isLoading = true;

  Future<void> getInfo() async {
    await getAllArtistsSongs();
    setState(() {});
  }

  @override
  void initState() {
    getInfo();

    super.initState();
  }

  getAllArtistsSongs() async {
    isLoading = true;
    setState(() {});
    songs = await GetInfo.getArtistssongs();
    print(songs);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
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
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${widget.info?.artists?[index]?.images?[index]?.url}')),
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
            ),
            Text(
              '${widget.info?.artists?[index]?.name}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ' Popularity: ${widget.info?.artists?[index]?.popularity}',
              style: Theme.of(context).textTheme.headline3,
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => SeeAll(
                              seeAll: songs,
                            ))));
                  },
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
            const SizedBox(height: 20),
            isLoading
                ? ShimmerPop()
                : SizedBox(
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
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${songs?.data?.artist?.discography?.singles?.items?[index]?.releases?.items?[0]?.coverArt?.sources?[0]?.url}',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                ),
                                15.horizontalSpace,
                                Text(
                                  '${songs?.data?.artist?.discography?.singles?.items?[index]?.releases?.items?[0]?.name}',
                                  style: Theme.of(context).textTheme.headline3,
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
          ]),
        ),
      ),
    );
  }
}
