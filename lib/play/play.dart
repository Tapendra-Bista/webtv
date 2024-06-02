import 'package:flutter/material.dart';
import 'package:mobiletv/footer/footer.dart';
import 'package:mobiletv/iframe/iframe.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:provider/provider.dart';

class Play extends StatefulWidget {
  static const routeName = "/Play";
  const Play({
    super.key,
  });

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    var mytextStyle = Theme.of(context).textTheme.headlineMedium;
    var primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(context.watch<ChannelNameProvider>().channelName!,
            style: mytextStyle),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Live Tv Channels Online Free Free Free",
                    style: mytextStyle!.copyWith(fontSize: 25),
                  ),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from mobileTv.",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Your are watching ${context.watch<ChannelNameProvider>().channelName} now !!!",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                )),
                const Scrollbar(
                    thickness: 0, child: Center(child: IframeScreen())),
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
