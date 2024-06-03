import 'package:flutter/material.dart';
import 'package:webtv/decoration/boxdecoration.dart';

class Channel extends StatefulWidget { // channel design 
  const Channel({
    super.key,
    required this.mytextStyle,
    required this.channelName,
    required this.imageUrl,
  });

  final TextStyle? mytextStyle;
  final String imageUrl;
  final String channelName;

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 135,
      decoration: boxDecoration,
      child: Center(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
        Image.asset(
          widget.imageUrl,
          fit: BoxFit.cover,
          height: 130,
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.black.withOpacity(0.3),
          height:1,
          thickness:1,
        ),
         const SizedBox(
          height: 5,
        ),
        Text(widget.channelName, style: widget.mytextStyle!.copyWith(fontSize: 14)),
                ],
              ),
      ),
    );
  }
}
