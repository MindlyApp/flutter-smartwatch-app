import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/splash_screen.dart';
import 'package:wear/wear.dart';

class MyRouterApp extends StatelessWidget {
  const MyRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Programming',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x2C1E47FF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        //'/second': (context) => const SecondScreen(),
      },
    );
  }
}
