import 'package:flutter/material.dart';


class Draws extends StatelessWidget {
  const Draws({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // textController.text.isEmpty
      //         ? Expanded(
      //             child: ListView.builder(
      //                 itemCount: listOfSearch.length,
      //                 itemBuilder: (context, index) {
      //                   return InkWell(
      //                     child: Container(
      //                         margin: EdgeInsets.symmetric(
      //                             horizontal: 12, vertical: 20),
      //                         child: Row(
      //                           children: [
      //                             Icon(
      //                               Icons.history,
      //                               color: Style.primaryColor,
      //                             ),
      //                             18.horizontalSpace,
      //                             Text(
      //                               listOfSearch[index],
      //                               style:
      //                                   Theme.of(context).textTheme.headline2,
      //                             ),
      //                             Spacer(),
      //                             IconButton(
      //                                 onPressed: (() {
      //                                   LocalStorrre.removeSearch(
      //                                       listOfSearch[index]);
      //                                   listOfSearch.removeAt(index);
      //                                   setState(() {});
      //                                 }),
      //                                 icon: Icon(
      //                                   Icons.cancel,
      //                                   color: Style.primaryColor,
      //                                 ))
      //                           ],
      //                         )),
      //                   );
      //                 }))
    );
  }
}