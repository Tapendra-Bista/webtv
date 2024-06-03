import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/decoration/myappbar.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/iframe/iframe.dart';
import 'package:webtv/provider/provider.dart';

class Play extends StatelessWidget {
  static const routeName = "/Play";
  const Play({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mytextStyle =
        Theme.of(context).textTheme.headlineMedium; // calling text theme
    var primaryColor = Theme.of(context).primaryColor; // calling primary color

    return Scaffold(
      appBar: myAppBar(context, context.watch<ChannelProvider>().channelName!),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from webtv.",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                Padding(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Consumer<ChannelProvider>(
                      // watch provider or to get data from provider
                      builder: (context, value, child) => Text(
                        "Your are watching ${value.channelName} now !!!",
                        style: mytextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const IframeScreen(), // calling to show stream part
                Footer(mytextStyle: mytextStyle), // calling disclaimer
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
