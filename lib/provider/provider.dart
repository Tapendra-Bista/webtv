import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

// model

class ChannelProvider extends ChangeNotifier {
  String? channelName;
  String? channelUrl;
  Widget? widget;
  final IFrameElement _iFrameElement = IFrameElement();
  ChannelProvider(
      {this.channelName = "Sky Sports Football",
      this.channelUrl = 'https://stream.crichd.sc/update/skysfotb.php'}) ;

  

  void updated({
    // function to get  update name,url from list
    required String channelname,
    required String channelurl,
  }) async {
    channelName = channelname;
    channelUrl = channelurl;
        _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.border = 'none';
debugPrint(channelurl.toString());
    _iFrameElement.src = channelUrl;
    _iFrameElement.allowFullscreen = true;

    try {
      ui.platformViewRegistry.registerViewFactory(
        'iframeElement',
        (int viewId) => _iFrameElement,
      );
      widget = HtmlElementView(
        viewType: 'iframeElement',
        key: UniqueKey(),
      );
    } catch (ex) {
      debugPrint("Error in widget at Iframe :$ex");
    }
  
    
    notifyListeners();
  }
}
