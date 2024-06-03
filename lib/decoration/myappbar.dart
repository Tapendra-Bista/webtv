import 'package:flutter/material.dart';
import 'package:webtv/decoration/ani_text.dart';

AppBar myAppBar(context, String text) {
  return AppBar(
      // appbar with custom design
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              height: 100,
              color: Colors.white,
              child: Image.asset(
                "image/tv.png",
              ))),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      title: SizedBox(
        child: Center(
          child: animatedText(
            text,
            Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
          ),
        ),
      ));
}
