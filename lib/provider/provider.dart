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
    _iFrameElement.style.height = '75%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.overflow = 'hidden'; // Hide the scroll
    _iFrameElement.style.border = 'none';
    _iFrameElement.src = channelUrl;
    debugPrint("url $channelUrl");

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    widget = HtmlElementView(
      viewType: 'iframeElement',
      key: UniqueKey(),
    );

    _iFrameElement.allowFullscreen = true;
    _iFrameElement.onFullscreenChange.listen((event) {
      // Handle fullscreen change event (optional)
      debugPrint("Iframe entered/exited fullscreen mode");
    });

    _iFrameElement.onFullscreenError.listen((event) {
      // Handle fullscreen error (optional)
      debugPrint("Error entering fullscreen mode for iframe");
    });
    notifyListeners();
  }
}
