import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/channel_design/channel.dart';
import 'package:webtv/provider/provider.dart';

class GridItems extends StatefulWidget {
  const GridItems(
      {super.key,
      required this.itemNumber,
      required this.mytextStyle,
      required this.myList,
      required this.adressUrl});

  final int itemNumber;
  final TextStyle? mytextStyle;
  final List myList;
  final String adressUrl;

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          // for channel list
          shrinkWrap: true,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemCount: widget.myList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              crossAxisCount: widget.itemNumber == 1 ? 2 : widget.itemNumber),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                navigationFunction(index);
              },
              child: Channel(
                  // channel property imageurl,imagename
                  mytextStyle: widget.mytextStyle,
                  channelName: widget.myList[index]['name']!,
                  imageUrl: widget.myList[index]['image']!),
            );
          }),
    );
  }

  void navigationFunction(int index) {
    try {
     
      Beamer.of(context).beamToNamed(
          "${widget.adressUrl}/${widget.myList[index]['url']!.replaceFirst("https://stream.crichd.sc/", '')}/${widget.myList[index]['name']!}");

      context.read<ChannelProvider>().updated(
          channelurl: widget.myList[index]['url']!,
          channelname: widget.myList[index]['name']!);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }
}
