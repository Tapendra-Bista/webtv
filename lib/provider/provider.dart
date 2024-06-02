import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

// model
class ChannelProvider extends ChangeNotifier {
  String? channelName;
  Widget? widget;
  final IFrameElement _iFrameElement = IFrameElement();
  String? channelUrl;
  ChannelProvider({
    this.channelName = "Ptv sports",
    this.channelUrl = 'https://stream.crichd.vip/update/ptv.php',
  });

  void updated({
    required String channelname,
    required String channelurl,
  }) async {
    channelName = channelname;
    channelUrl = channelurl;

    notifyListeners();
  }

  void provideTv() async {
    _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.overflow = 'hidden'; // Hide the scroll
    _iFrameElement.style.border = 'none';
    _iFrameElement.src = channelUrl;

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    widget = HtmlElementView(
      viewType: 'iframeElement',
      key: UniqueKey(),
    );

    _iFrameElement.allowFullscreen = true;

    notifyListeners();
  }
}
