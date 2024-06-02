import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var mytextStyle = Theme.of(context).textTheme.headlineMedium;
    var primaryColor = Theme.of(context).primaryColor;
    context.watch<ChannelProvider>().provideTv();
      var mQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leadingWidth:mQ.width*0.2,
       leading: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height:100,
            color:Colors.white,
            child: Image.asset("image/tv.png",))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(context.watch<ChannelProvider>().channelName!,
            style: mytextStyle!.copyWith(color:Colors.white,fontWeight: FontWeight.normal,fontSize:30)),
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
                    style: mytextStyle.copyWith(fontSize: 25),
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
                    child: Text(
                      "Your are watching ${context.watch<ChannelProvider>().channelName} now !!!",
                      style: mytextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                const IframeScreen(),
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
