import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

// model
class ChannelProvider extends ChangeNotifier {
  String? channelName;
  String? channelUrl;

  Widget? widget;
  final IFrameElement _iFrameElement = IFrameElement();
  ChannelProvider({
    this.channelName = "Ptv sports",
    this.channelUrl = 'https://stream.crichd.vip/update/ptv.php',
  });

  void updated({
    // function to get  update name,url from list
    required String channelname,
    required String channelurl,
  }) async {
    channelName = channelname;
    channelUrl = channelurl;

    notifyListeners();
  }

  void tv() {
    _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.border = 'none';
    _iFrameElement.allowFullscreen = true;
    _iFrameElement.src = channelUrl;
// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    widget = HtmlElementView(
      viewType: 'iframeElement',
      key: UniqueKey(),
    );
    notifyListeners();
  }
}
