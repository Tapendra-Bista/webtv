import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/channel_design/channel.dart';
import 'package:webtv/play/play.dart';
import 'package:webtv/provider/provider.dart';
import 'package:webtv/search/search.dart';

class GridItems extends StatelessWidget {
  const GridItems(
      {super.key,
      required this.itemNumber,
      required this.mytextStyle,
      required this.myList});

  final int itemNumber;
  final TextStyle? mytextStyle;
  final List myList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          // for channel list
          shrinkWrap: true,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemCount: myList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              crossAxisCount: itemNumber == 1 ? 2 : itemNumber),
          itemBuilder: (BuildContext context, int index) {
            channelSearch.add(
                ChannelSearch(myList[index]['name'], myList[index]['url'],myList[index]['image']));

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Play.routeName);
                context.read<ChannelProvider>().updated(
                    channelurl: myList[index]['url']!,
                    channelname: myList[index]['name']!);
              },
              child: Channel(
                  // channel property imageurl,imagename
                  mytextStyle: mytextStyle,
                  channelName: myList[index]['name']!,
                  imageUrl: myList[index]['image']!),
            );
          }),
    );
  }
}
