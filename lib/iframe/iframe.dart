import 'package:flutter/material.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:provider/provider.dart';

class IframeScreen extends StatelessWidget {
  const IframeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 var provider =  context.watch<ToChangeChannelProvider>();
 provider.provideTv();
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:provider.widget),
      ],
    );
  }
}
