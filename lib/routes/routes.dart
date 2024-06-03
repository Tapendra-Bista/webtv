import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:webtv/all_sports/all_sports.dart';
import 'package:webtv/cricket/cricket.dart';
import 'package:webtv/football/football.dart';
import 'package:webtv/home/home.dart';

import 'package:webtv/play/play.dart';

Route<dynamic>? routes(settings) {
  switch (settings.name) {
    case Play.routeName:
      return PageAnimationTransition(
          page: const Play(), pageAnimationType: RightToLeftFadedTransition());
    case Football.routeName:
      return PageAnimationTransition(
          page: const Football(),
          pageAnimationType: RightToLeftFadedTransition());
    case Cricket.routeName:
      return PageAnimationTransition(
          page: const Cricket(),
          pageAnimationType: RightToLeftFadedTransition());
    case AllSports.routeName:
      return PageAnimationTransition(
          page: const AllSports(),
          pageAnimationType: RightToLeftFadedTransition());
    default:
      return PageAnimationTransition(
          page: const Home(), pageAnimationType: RightToLeftFadedTransition());
  }
}
