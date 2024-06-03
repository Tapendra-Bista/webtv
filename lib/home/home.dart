import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/category/category.dart';
import 'package:webtv/channel_design/channel.dart';
import 'package:webtv/channels_url/channels_url.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/play/play.dart';
import 'package:webtv/provider/provider.dart';


class Home extends StatefulWidget {
  static const routeName = "/home";
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
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                      // for channel list
                      shrinkWrap: true,
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemCount: channelList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          crossAxisCount: itemNumber == 1 ? 2 : itemNumber),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Play.routeName);
                            context.read<ChannelProvider>().updated(
                              channelurl: channelList[index]['url']!,
                                channelname: channelList[index]['name']!);
                          
                          },
                          child: Channel(
                              // channel property imageurl,imagename
                              mytextStyle: mytextStyle,
                              channelName: channelList[index]['name']!,
                              imageUrl: channelList[index]['image']!),
                        );
                      }),
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
