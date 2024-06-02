import 'package:flutter/material.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:provider/provider.dart';

class IframeScreen extends StatelessWidget {
  const IframeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: context.watch<ChannelProvider>().widget),
      ],
    );
  }
}
