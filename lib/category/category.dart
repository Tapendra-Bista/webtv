import 'package:flutter/material.dart';
import 'package:webtv/all_sports/all_sports.dart';
import 'package:webtv/cricket/cricket.dart';
import 'package:webtv/decoration/btnstyle.dart';
import 'package:webtv/football/football.dart';

class Category extends StatefulWidget {
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
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: widget.mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.games_rounded,
                  color: widget.primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, AllSports.routeName);
                },
                label: Text("All Sports", style: widget.mytextStyle)),
          ),
        ),
        SizedBox(
          width: widget.mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.sports_cricket_rounded,
                  color: widget.primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, Cricket.routeName);
                },
                label: Text("Cricket", style: widget.mytextStyle)),
          ),
        ),
        SizedBox(
          width: widget.mediaQuery.width * 0.3,
          height: 30,
          child: FittedBox(
            child: TextButton.icon(
                icon: Icon(
                  Icons.sports_soccer_rounded,
                  color: widget.primaryColor,
                ),
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, Football.routeName);
                },
                label: Text("Football", style: widget.mytextStyle)),
          ),
        ),
      ],
    );
  }
}
