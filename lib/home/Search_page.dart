import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hear_me/components/cachedNetworkImage.dart';
import 'package:hear_me/model/Search.dart';
import 'package:hear_me/style/style.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../repository/get_info.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey();

  String change = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          100.verticalSpace,
          Row(
            children: [
              25.verticalSpace,
              SearchBarAnimation(
                hintText: 'What do you want to listen to?',
                buttonColour: Style.primaryColor,
                hintTextColour: Style.blackColor,
                searchBoxColour: Style.primaryColor,
                enteredTextStyle:
                    TextStyle(fontSize: 15, color: Style.blackColor),
                searchBoxWidth: 380,
                enableKeyboardFocus: true,
                isOriginalAnimation: false,
                buttonBorderColour: Colors.black45,
                onFieldSubmitted: (String value) {
                  debugPrint('onFieldSubmitted value $value');
                },
                onChanged: (value) {
                  change = value;
                  setState(() {});
                },
                textEditingController: textController,
                trailingWidget: Icon(Icons.search),
                secondaryButtonWidget: Icon(
                  Icons.arrow_back_ios,
                  color: Style.blackColor,
                ),
                buttonWidget: Icon(
                  Icons.search,
                  color: Style.blackColor,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: GetInfo.getSearch(text: change),
            builder: (ctx, AsyncSnapshot<Search?> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.artists?.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 120,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                margin:
                                    const EdgeInsets.only(left: 10, right: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomImageNetwork(
                                            height: 130,
                                            width: 130,
                                            image:
                                                "${snapshot.data?.artists?.items?[index]?.data?.visuals?.avatarImage?.sources?.first?.url}")),
                                    SizedBox(
                                      width: 200.w,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, top: 50),
                                        child: Text(
                                            "${snapshot.data?.artists?.items?[index]?.data?.profile?.name}",
                                            overflow: TextOverflow.ellipsis,
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
              } else if (change.isEmpty) {
                return Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 200),
                        height: 75,
                        width: 75,
                        decoration: const BoxDecoration(
                          color: Color(0xffEBF4F1),
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                        child: Center(
                            child: Text(
                          "😥",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700, fontSize: 30),
                        )),
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
                          fontSize: 22,
                          color: const Color(0xff194B38),
                          letterSpacing: 0.3),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Search and see more items.",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff9C9C9C),
                            letterSpacing: 0.3),
                      ),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
