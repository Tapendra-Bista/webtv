import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
import 'dart:ui_web' as ui;
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

  void updated({ // function to get  update name,url from list
    required String channelname,
  required String channelurl,
  }) async {
    channelName = channelname;
    channelUrl = channelurl;
 _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.overflow = 'hidden'; // Hide the scroll
    _iFrameElement.style.border = 'none';
    _iFrameElement.src = channelUrl;
    debugPrint(channelUrl);
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    widget = HtmlElementView(
      viewType: 'iframeElement',
      key: UniqueKey(),
    );

 _iFrameElement.allowFullscreen = true;
    _iFrameElement.onFullscreenChange.listen((data) {
      debugPrint("checked condition  of fullscreen: $data");
    });
    _iFrameElement.onFullscreenError.listen((data) {
      debugPrint("checked condition of error while doing fullscreen: $data");
    });
    _iFrameElement.onError.listen((data) {
      debugPrint("checked condition of stream error : $data");
    });
  
    notifyListeners();
  }

 
}

