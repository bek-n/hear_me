import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/home/playlist/playList.dart';
import 'package:hear_me/model/artists.dart';
import 'package:hear_me/store/local.dart';
import 'package:hear_me/style/style.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../model/playlist.dart';
import '../model/top200.dart';
import '../repository/get_info.dart';
import 'Popular_artists.dart';

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
  Artists? artists;
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
    artists = await GetInfo.getArtists();
    print(artists);
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
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RollingSwitch.icon(
                initialState: !isChangedTheme,
                onChanged: (s) {
                  isChangedTheme = !isChangedTheme;
                  MyApp.of(context)!.change();
                  LocalStorrre.setTheme(isChangedTheme);
                  setState(() {});
                },
                rollingInfoRight: const RollingIconInfo(
                  icon: Icons.light_mode,
                ),
                rollingInfoLeft: const RollingIconInfo(
                  icon: Icons.dark_mode,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {}),
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
              Container(
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
        body: SingleChildScrollView(
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
                              builder: ((context) => PlayList(playLists: lifOfPlaylists, ))));
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
                            Container(
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              height: 160.h,
                              width: 160.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${lifOfPlaylists?.images?[index]?.url}'),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                            ),
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
                              builder: ((context) => PopularArtists())));
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
                    itemCount: artists?.artists?.length,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${artists?.artists?[index]?.images?[index]?.url}'),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                            ),
                            8.verticalSpace,
                            Text(
                              '${artists?.artists?[index]?.name}',
                              style: Theme.of(context).textTheme.headline3,
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
                    padding: EdgeInsets.only(left: 24),
                    itemCount: top200songs?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              height: 160.h,
                              width: 160.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${top200songs?[index]?.trackMetadata?.displayImageUri}'),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                            ),
                          ],
                        ))),
              ),
            ],
          ),
        ));
  }
}
