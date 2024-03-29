import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/data_privacy_screen.dart';
import 'package:mind_pro/presentation/imprint_screen.dart';
import 'package:mind_pro/presentation/login/login_username_screen.dart';
import 'package:mind_pro/presentation/login/reset_password_screen.dart';
import 'package:mind_pro/presentation/login/login_select_screen.dart';
import 'package:mind_pro/presentation/mainmenu/mainmenu.dart';
import 'package:mind_pro/presentation/splash_screen.dart';

class MyRouterApp extends StatelessWidget {
  const MyRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Programming',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x2C1E47FF),
      ),

      /// see also: https://docs.flutter.dev/cookbook/navigation/named-routes
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        //'/second': (context) => const SecondScreen(),
        '/login': (context) => const LoginSelectScreen(),
        '/main-menu': (context) => const MainMenuScreen(),
        '/login/username': (context) => const LoginUsernameScreen(),
        '/login/reset-password': (context) => const ResetPasswordScreen(),
        '/info/imprint': (context) => const ImprintScreen(),
        '/info/data-privacy': (context) => const DataPrivacyScreen(),
      },
    );
  }
}
