import 'package:flutter/material.dart';
import 'package:mobiletv/home/home.dart';
import 'package:mobiletv/provider/provider.dart';
import 'package:mobiletv/routes/routes.dart';
import 'package:mobiletv/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=>ChannelProvider ()),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mobiletv',
        theme: myThemeData,
        routes: routes,
        initialRoute: Home.routeName,
      ),
    );
  }
}
