import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webtv/channels_url/channels_url.dart';
import 'package:webtv/provider/provider.dart';
import 'package:webtv/routes/routes.dart';
import 'package:webtv/search/search.dart';
import 'package:webtv/theme/theme.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    addingItem(channelSearch, channelList);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChannelProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'webtv',
        theme: myThemeData,
        routerDelegate: BeamerDelegate(
          
            notFoundRedirectNamed: '/error',
            locationBuilder: RoutesLocationBuilder(routes: routes).call),
        routeInformationParser: BeamerParser(),
      ),
    );
  }
}
