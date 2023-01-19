import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/components/cachedNetworkImage.dart';
import 'package:hear_me/components/timerForSearch.dart';
import 'package:hear_me/model/Search.dart';
import 'package:hear_me/style/style.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../../store/local.dart';
import '../../store/local_store.dart';
import '../../repository/get_info.dart';
import 'SearchInfo.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey();
  final _delayed = Delayed(milliseconds: 700);
  List<String> listOfSearch = [];
  String change = "";
  Search? s;

  @override
  void initState() {
    getInfo();
    getSearchHistory();
    print(listOfSearch);

    super.initState();
  }

  Future<void> getInfo() async {
    await getSearch();
  }

  getSearch() async {
    s = await GetInfo.getSearch(text: change);
    print(s);
  }

  getSearchHistory() async {
    listOfSearch = await LocalStorrre.getSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          100.verticalSpace,
          Column(
            children: [
              25.verticalSpace,
              SearchBarAnimation(
                hintText: 'What do you want to listen to?',
                buttonColour: Style.primaryColor,
                hintTextColour: Style.blackColor,
                searchBoxColour: Style.primaryColor,
                enteredTextStyle:
                    const TextStyle(fontSize: 15, color: Style.blackColor),
                searchBoxWidth: 350.w,
                enableKeyboardFocus: true,
                isOriginalAnimation: false,
                buttonBorderColour: Colors.black45,
                onChanged: (value) {
                  _delayed.run(() async {
                    change = value;
                    s = await GetInfo.getSearch(text: textController.text);
                    LocalStorrre.setSearch(textController.text);

                    setState(() {});
                  });
                },
                textEditingController: textController,
                trailingWidget: change.isEmpty
                    ? SizedBox.shrink()
                    : InkWell(
                        child: Icon(
                          Icons.close,
                          color: Style.blackColor,
                        ),
                        onTap: () {
                          change = textController.text = "";
                          setState(() {});
                        },
                      ),
                secondaryButtonWidget: const Icon(
                  Icons.arrow_back_ios,
                  color: Style.blackColor,
                ),
                buttonWidget: const Icon(
                  Icons.search,
                  color: Style.blackColor,
                ),
              ),
            ],
          ),
          change.isEmpty
              ? Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 200),
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/search.gif')),
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Text(
                      "No searches yet",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
                          color: const Color(0xff194B38),
                          letterSpacing: 0.3),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Find your favorite music",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                )
              : FutureBuilder(
                  future: GetInfo.getSearch(text: change),
                  builder: (ctx, AsyncSnapshot<Search?> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount:
                                snapshot.data?.artists?.items?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              SearchArtistInfo(
                                                se: snapshot.data,
                                                indx: index,
                                              )),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Container(
                                        height: 120,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24)),
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(24)),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CustomImageNetwork(
                                                    height: 130.h,
                                                    width: 130.w,
                                                    image:
                                                        "${snapshot.data?.artists?.items?[index]?.data?.visuals?.avatarImage?.sources?.first?.url}")),
                                            SizedBox(
                                              width: 200.w,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 30, top: 50),
                                                child: Text(
                                                    "${snapshot.data?.artists?.items?[index]?.data?.profile?.name}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
        ],
      ),
    );
  }
}
