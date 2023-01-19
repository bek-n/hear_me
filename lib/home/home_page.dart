import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/components/cachedNetworkImage.dart';
import 'package:hear_me/home/Profile_page%20(1).dart';
import 'package:hear_me/home/playlist/playList.dart';
import 'package:hear_me/home/search/Search_page.dart';
import 'package:hear_me/home/top200/200info.dart';
import 'package:hear_me/model/Search.dart';
import 'package:hear_me/model/artists.dart';
import 'package:hear_me/store/local.dart';
import 'package:hear_me/style/style.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/shimmer.dart';
import '../main.dart';
import '../model/playlist.dart';
import '../model/top200.dart';
import '../repository/get_info.dart';
import 'popular page/Popular_artists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String name = '';
  bool isChangedTheme = true;
  GlobalKey<ScaffoldState> key = GlobalKey();
  Playlist? lifOfPlaylists;
  Artists? artistt;
  List<Top200?>? top200songs = [];
  bool isLoading = true;

  Future<void> getInfo() async {
    SharedPreferences _local = await SharedPreferences.getInstance();
    name = _local.getString('nickname') ?? '';
    isChangedTheme = await LocalStorrre.getTheme();
    await getAllPlay();
    await getAllArtists();
    await getTop();

    setState(() {});
  }

  @override
  void initState() {
    getInfo();

    super.initState();
  }

  getAllPlay() async {
    isLoading = true;
    setState(() {});
    lifOfPlaylists = await GetInfo.getPlaylist();
    print(lifOfPlaylists);
    isLoading = false;
    setState(() {});
  }

  getAllArtists() async {
    isLoading = true;
    setState(() {});
    artistt = await GetInfo.getArtists();
    print(artistt);
    isLoading = false;
    setState(() {});
  }

  getTop() async {
    isLoading = true;
    setState(() {});
    top200songs = await GetInfo.getTOP();
    print(top200songs);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchPage()));
                }),
                icon: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.notifications_active,
                  size: 28,
                  color: Colors.white,
                ))
          ],
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => ProfilePage())));
                },
                child: Container(
                  height: 50.r,
                  width: 50.r,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://source.unsplash.com/random/1'),
                          fit: BoxFit.cover)),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  ' 👋 Hello $name',
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: isLoading
            ? const ShimmerHome()
            : SingleChildScrollView(
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
                            child: TextButton(
                              onPressed: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => PlayList(
                                          playLists: lifOfPlaylists,
                                        ))));
                              }),
                              child: Text(
                                'See all',
                                style: Style.textStyleSeeAll(),
                              ),
                            )),
                      ],
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 24),
                          itemCount: lifOfPlaylists?.images?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  CustomImageNetwork(
                                      height: 160,
                                      width: 160,
                                      image:
                                          '${lifOfPlaylists?.images?[index]?.url}')
                                ],
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        '${lifOfPlaylists?.name}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
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
                            child: TextButton(
                              onPressed: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => PopularArtists(
                                          art: artistt,
                                        ))));
                              }),
                              child: Text(
                                'See all',
                                style: Style.textStyleSeeAll(),
                              ),
                            )),
                      ],
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 24),
                          scrollDirection: Axis.horizontal,
                          itemCount: artistt?.artists?.length,
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  CustomImageNetwork(
                                      radius: 1000,
                                      height: 160,
                                      width: 160,
                                      image:
                                          '${artistt?.artists?[index]?.images?[index]?.url}'),
                                  8.verticalSpace,
                                  Text(
                                    '${artistt?.artists?[index]?.name}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )
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
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => TopInfo(
                                        top: top200songs,
                                      ))));
                            },
                            child: Text(
                              'See all',
                              style: Style.textStyleSeeAll(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 24),
                          itemCount: top200songs?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: CustomImageNetwork(
                                        height: 160,
                                        width: 160,
                                        image:
                                            '${top200songs?[index]?.trackMetadata?.displayImageUri}'),
                                  )
                                ],
                              ))),
                    ),
                  ],
                ),
              ));
  }
}
