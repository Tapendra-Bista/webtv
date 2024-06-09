import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:webtv/decoration/ani_text.dart';
import 'package:webtv/search/search.dart';

AppBar myAppBar(BuildContext context, String text) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
              onPressed: () {
                mechanisimToSearch(context);
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              )),
        )
      ],
      // appbar with custom design
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () => context.beamToReplacementNamed('/home'),
            child: Container(
                height: AppBar().preferredSize.height,
                color: Colors.white,
                child: Image.asset(
                  "image/tv.png",
                )),
          )),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      title: animatedText(
        text,
        Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: AppBar().preferredSize.height / 2),
      ));
}
