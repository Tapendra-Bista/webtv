import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webtv/category/category.dart';
import 'package:webtv/channels_url/footb_chennels.dart';
import 'package:webtv/decoration/myappbar.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/home/grid_items.dart';

class Football extends StatefulWidget {
  static const routeName = "/Football";
  const Football({super.key});

  @override
  State<Football> createState() => _FootballState();
}

class _FootballState extends State<Football> {
  @override
  Widget build(BuildContext context) {
    var mytextStyle =
        Theme.of(context).textTheme.headlineMedium; // calling text theme
    var primaryColor = Theme.of(context).primaryColor; // calling primary color
    var mediaQuery = MediaQuery.of(context).size; // mediaQuery for responsive
    var itemNumber = min(5, (mediaQuery.width / 200).toInt());

    return Scaffold(
      appBar: myAppBar(context, "Football"), // calling custom appbar
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Live Tv Channels Online Free Free Free",
                    style: mytextStyle!.copyWith(fontSize: 25),
                  ),
                ),
                Category(
                    mediaQuery: mediaQuery,
                    primaryColor: primaryColor,
                    mytextStyle: mytextStyle),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from webtv.",
                    style: mytextStyle.copyWith(fontSize: 14),
                  ),
                ),
                GridItems(
                  itemNumber: itemNumber,
                  mytextStyle: mytextStyle,
                  myList: footballChannelList,
                ),
                const SizedBox(
                  height: 30,
                ),
                Footer(mytextStyle: mytextStyle), // calling desclaimer
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
