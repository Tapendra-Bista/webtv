import 'package:flutter/material.dart';
import 'package:mobiletv/footer/footer.dart';
import 'package:mobiletv/iframe/iframe.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:provider/provider.dart';

class Play extends StatelessWidget {
  static const routeName = "/Play";
  const Play({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mytextStyle = Theme.of(context).textTheme.headlineMedium;
    var primaryColor = Theme.of(context).primaryColor;
    context.watch<ChannelProvider>().provideTv();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(context.watch<ChannelProvider>().channelName!,
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
                      "Note: Please don't reload page , it may be crashed due to non use of backend and go to home page to change channel.",
                      style: mytextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: primaryColor),
                    ),
                  ),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Your are watching ${context.watch<ChannelProvider>().channelName} now !!!",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                )),
                const Center(child: IframeScreen()),
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
