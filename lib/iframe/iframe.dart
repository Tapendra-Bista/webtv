import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';
import 'package:webtv/provider/provider.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  final IFrameElement _iFrameElement = IFrameElement();
  @override
  void initState() {
    _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.src = 'https://stream.crichd.vip/update/skysfotb.php';
    _iFrameElement.style.border = 'none';
    _iFrameElement.allowFullscreen = true;

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<ChannelProvider>(builder: (context, value, child) {
          return value.widget ?? _iframeWidget ;
        }));
  }
}
