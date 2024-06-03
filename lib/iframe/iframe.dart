import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/provider/provider.dart';


class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
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
