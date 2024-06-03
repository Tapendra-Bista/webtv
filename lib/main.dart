import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtv/provider/provider.dart';
import 'package:webtv/routes/routes.dart';
import 'package:webtv/theme/theme.dart';

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
        ChangeNotifierProvider(create: (context) => ChannelProvider()),
     
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'webtv',
        theme: myThemeData,
    
        onGenerateRoute: routes,
      ),
    );
  }
}
