import 'package:flutter/material.dart';
import 'package:webtv/decoration/btnstyle.dart';
import 'package:webtv/home/home.dart';

class Category extends StatelessWidget { // top part which distinguish app sport,cricket and football
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Home(appbarName: "All Sports")));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Home(appbarName: "Cricket")));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Home(appbarName: "Football")));
                },
                label: Text("Football", style: mytextStyle)),
          ),
        ),
      ],
    );
  }
}
