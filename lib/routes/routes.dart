import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:webtv/all_sports/all_sports.dart';
import 'package:webtv/cricket/cricket.dart';
import 'package:webtv/football/football.dart';
import 'package:webtv/home/home.dart';
import 'package:webtv/play/play.dart';

var routes = {
  "/": (context, state, data) => const BeamPage(
        key: ValueKey('/initial'),
        title: 'webtv',
        name: 'webtv',
        child: Home(), // widget
      ),

  "/cricket": (context, state, data) => const BeamPage(
        key: ValueKey('/home/cricket'),
        title: 'webtv',
        name: 'webtv',

        child: Cricket(), // widget
      ),
  "/football": (context, state, data) => const BeamPage(
        key: ValueKey('/home/football'),
        title: 'webtv',
        name: 'webtv',
        child: Football(), // widget
      ),
  "/all_sports": (context, state, data) => const BeamPage(
        key: ValueKey('/home/all'),
        title: 'webtv',
        name: 'webtv',
        child: AllSports(), // widget
      ),
  "/error": (context, state, data) => BeamPage(
        key: const ValueKey('error'),
        title: 'webtv',
        name: 'webtv',
        child: Scaffold(
            body: Column(
       mainAxisAlignment: MainAxisAlignment.center,       
              children: [
                 Center(
                          child: Text(
                "404",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize:60,fontWeight: FontWeight.bold),
                          ),
                        ),
                Center(
                          child: Text(
                "Page not found",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
              ],
            )), // widget
      ),
  '/play/:update/:link/:title': (context, state, data) => const BeamPage(
        key: ValueKey('/home/play/'),
        title: 'webtv',
        name: 'webtv',
        child: Play(), // widget
      ),
  '/cricket/play/:update/:link/:title': (context, state, data) =>
      const BeamPage(
        key: ValueKey('/home/cricket/play/'),
        title: 'webtv',
        name: 'webtv',
        child: Play(), // widget
      ),
  '/football/play/:update/:link/:title': (context, state, data) =>
      const BeamPage(
        key: ValueKey('/home/football/play/'),
        title: 'webtv',
        name: 'webtv',
        child: Play(), // widget
      ),
  '/all_sports/play/:update/:link/:title': (context, state, data) =>
      const BeamPage(
        key: ValueKey('/home/all/play/'),
        title: 'webtv',
        name: 'webtv',
        child: Play(), // widget
      ),
  '/search/play/:update/:link/:title': (context, state, data) => const BeamPage(
        key: ValueKey('/search/play/'),
        title: 'webtv',
        name: 'webtv',
        child: Play(), // widget
      ),
};
