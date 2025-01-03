import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/decoration/ani_text.dart';
import 'package:webtv/footer/footer.dart';
import 'package:webtv/iframe/iframe.dart';
import 'package:webtv/provider/provider.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

// context.watch<ChannelProvider>().channelName!,
class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    var mytextStyle =
        Theme.of(context).textTheme.headlineMedium; // calling text theme
    // calling primary color
    // calling provider void function from channel provider

    return Scaffold(
      appBar: AppBar(

          // appbar with custom design
          leadingWidth: MediaQuery.of(context).size.width * 0.2,
          leading: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => context.beamToReplacementNamed("/"),
                child: Container(
                    height: AppBar().preferredSize.height,
                    color: Colors.white,
                    child: Image.asset(
                      "image/tv.png",
                    )),
              )),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: animatedText(
            context.watch<ChannelProvider>().channelName!,
            Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: AppBar().preferredSize.height / 2),
          )),
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
                  padding: const EdgeInsets.only(top: 20, bottom:17),
                  child: Text(
                    "Live Tv Channels Online Free Free Free",
                    style: mytextStyle!.copyWith(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:17, bottom:17),
                  child: Text(
                    "Watch Live Sports Tv Streaming online. Watch live sports football, cricket, and all popular live sports tv channels online free from webtv.",
                    style: mytextStyle.copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 17),
                  child: Text(
                    " Double-tap on the screen to enter full-screen mode. ",
                    style: mytextStyle.copyWith(
                        fontSize: 18, color: Theme.of(context).primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:17, bottom:17),
                  child: Consumer<ChannelProvider>(
                      // watch provider or to get data from provider'
                      builder: (context, value, child) {
                    return Text(
                      "You are watching ${value.channelName} now !!!",
                      style: mytextStyle.copyWith(fontSize: 14),
                    );
                  }),
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
