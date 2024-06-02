import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobiletv/category/category.dart';
import 'package:mobiletv/channels/channels.dart';
import 'package:mobiletv/footer/footer.dart';
import 'package:mobiletv/play/play.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:mobiletv/tv/tvlist.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";
  const Home({super.key, required this.appbarName});
  final String appbarName;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mytextStyle = Theme.of(context).textTheme.headlineMedium;
    var primaryColor = Theme.of(context).primaryColor;
    var mQ = MediaQuery.of(context).size;
    var itemNumber = min(5, (mQ.width / 200).toInt());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(widget.appbarName, style: mytextStyle),
      ),
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
                    mQ: mQ,
                    primaryColor: primaryColor,
                    mytextStyle: mytextStyle),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from mobileTv.",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
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
                              Play.routeName,
                            );
                          },
                          child: ListItems(
                              mytextStyle: mytextStyle,
                              channelName: channelList[index]['name']!,
                              imageUrl: channelList[index]['image']!),
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Footer(mytextStyle: mytextStyle),
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
