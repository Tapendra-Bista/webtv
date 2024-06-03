import 'package:flutter/material.dart';
import 'package:webtv/provider/provider.dart';
import 'package:provider/provider.dart';

class IframeScreen extends StatelessWidget {
  const IframeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<ChannelProvider>().provideTv(); // calling provider void function from channel provider
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Consumer<ChannelProvider>(
              builder: (context, value, child) => value.widget!, //calling widget to show stream
            )),
      ],
    );
  }
}
