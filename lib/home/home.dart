import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webtv/category/category.dart';
import 'package:webtv/channels_url/channels_url.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/home/grid_items.dart';
import 'package:webtv/search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
         
    var mytextStyle =
        Theme.of(context).textTheme.headlineMedium; // calling text theme
    var primaryColor = Theme.of(context).primaryColor; // calling primary color
    var mediaQuery = MediaQuery.of(context).size; // mediaQuery for responsive
    var itemNumber = min(5, (mediaQuery.width / 200).toInt());

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
                onPressed: () {
                  mechanisimToSearch(context);
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
        // appbar with custom design
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                height: 100,
                color: Colors.white,
                child: Image.asset(
                  "image/tv.png",
                ))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      // calling custom appbar
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
                  child: Center(
                    child: Text(
                      "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from webtv.",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                GridItems(
                  adressUrl: "/home/play",
                  itemNumber: itemNumber,
                  mytextStyle: mytextStyle,
                  myList: channelList,
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
