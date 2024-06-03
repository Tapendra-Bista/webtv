import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/provider/provider.dart';


class IframeScreen extends StatelessWidget {
  const IframeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<ChannelProvider>(
          builder: (context, value, child) {
                 
            return value.widget!;
          } //calling widget to show stream
        ));
  }
}
