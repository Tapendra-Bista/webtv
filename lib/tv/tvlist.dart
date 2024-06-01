import 'package:flutter/material.dart';
import 'package:mobiletv/decoration/boxdecoration.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.mytextStyle,
    required this.channelName,
    required this.imageUrl,
  });

  final TextStyle? mytextStyle;
  final String imageUrl;
  final String channelName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 135,
      decoration: boxDecoration,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 130,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(channelName, style: mytextStyle!.copyWith(fontSize: 14)),
        ],
      )),
    );
  }
}
