import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

// model
class ChannelNameProvider extends ChangeNotifier {
  String? channelName;
  ChannelNameProvider({
    this.channelName = "Ptv sports",
  });

  void updatedName({
    required String channelname,
  }) async {
    channelName = channelname;
    notifyListeners();
  }
}

class ToChangeChannelProvider extends ChangeNotifier {
  final IFrameElement _iFrameElement = IFrameElement();
  Widget? widget;

  String? channelUrl;

  ToChangeChannelProvider({
    this.channelUrl = 'https://stream.crichd.vip/update/ptv.php',
  });

  void provideUrl({
    required String newUrl,
  }) async {
    channelUrl = newUrl; 


    notifyListeners();
  }

   void provideTv () async{
   _iFrameElement.style.height = '90%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.allowFullscreen = true;
    _iFrameElement.style.overflow = 'hidden'; // Hide the scroll
    _iFrameElement.style.border = 'none';
    _iFrameElement.src = channelUrl;
    debugPrint("url $channelUrl");
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );
    widget = HtmlElementView(viewType: 'iframeElement', key: UniqueKey());
     notifyListeners();
    }
    
}
