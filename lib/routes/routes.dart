import 'package:mobiletv/home/home.dart';
import 'package:mobiletv/play/play.dart';

var routes = {
  Home.routeName: (context) => const Home(
        appbarName: "Mobile Tv",
      ),
  PlayStream.routeName: (contex) => const PlayStream(),
};
