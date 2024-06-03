import 'package:flutter/material.dart';
import 'package:webtv/decoration/ani_text.dart';

AppBar myAppBar(context, String title) {
  return AppBar(
      // appbar with custom design
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              
              color: Colors.white,
              child: Image.asset(
                "image/tv.png",
              ))),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          animatedText(
            title,
            Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
          ),
        ],
      ));
}
