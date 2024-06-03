import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/category/category.dart';
import 'package:webtv/channel_design/channel.dart';
import 'package:webtv/channels_url/channels_url.dart';
import 'package:webtv/decoration/myappbar.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/play/play.dart';
import 'package:webtv/provider/provider.dart';

class AllSports extends StatefulWidget {
  static const routeName = "/AllSports";
  const AllSports({super.key});
 
  @override
  State<AllSports> createState() => _AllSportsState();
}

class _AllSportsState extends State<AllSports> {
  @override
  Widget build(BuildContext context) {
    var mytextStyle =
        Theme.of(context).textTheme.headlineMedium; // calling text theme
    var primaryColor = Theme.of(context).primaryColor; // calling primary color
    var mediaQuery = MediaQuery.of(context).size; // mediaQuery for responsive
    var itemNumber = min(5, (mediaQuery.width / 200).toInt());

    return Scaffold(
      appBar: myAppBar(context,"All sports"), // calling custom appbar
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
                            context.read<ChannelProvider>().updated(
                                channelurl: channelList[index]['url']!,
                                channelname: channelList[index]['name']!);

                            Navigator.pushNamed(
                                context,
                                Play.routeName
                                );
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
