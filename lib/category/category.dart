import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:webtv/decoration/btnstyle.dart';

class Category extends StatelessWidget {
  // top part which distinguish app sport,cricket and football
  const Category({
    super.key,
    required this.mediaQuery,
    required this.primaryColor,
    required this.mytextStyle,
  });

  final Size mediaQuery;
  final Color primaryColor;
  final TextStyle? mytextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.games_rounded,
                  color: primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
           
                  Beamer.of(context).beamToNamed("/all_sports");
                },
                label: Text("All Sports", style: mytextStyle)),
          ),
        ),
        SizedBox(
          width: mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.sports_cricket_rounded,
                  color: primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
                  
                  Beamer.of(context).beamToNamed('/cricket');
                },
                label: Text("Cricket", style: mytextStyle)),
          ),
        ),
        SizedBox(
          width: mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.sports_soccer_rounded,
                  color: primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
                  Beamer.of(context).beamToNamed('/football');
                },
                label: Text("Football", style: mytextStyle)),
          ),
        ),
      ],
    );
  }
}
