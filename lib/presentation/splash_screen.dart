import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}) : super();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  bool _timerStarted = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            // after 1,5 seconds goto login screen, see AD-25
            _timer = Timer(const Duration(milliseconds: 1500), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', ModalRoute.withName('/login'));
            });
            _timerStarted = true;
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return createScreen();
        });
  }

  Scaffold createScreen() {
    return Scaffold(
      body: Center(
        child: WatchShape(
          builder: (BuildContext context, WearShape shape, Widget? child) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            return Stack(
                /*decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/gradient_bg.png"),
                        fit: BoxFit.fill),
                  ),*/
                children: <Widget>[
                  /*Positioned.fill(
                      child: Image(
                        image: AssetImage('assets/gradient_bg.png'),
                        fit: BoxFit.none,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                    ),*/
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*Text(
                    'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                  ),*/
                      Image.asset(
                        "assets/logo_neu.png",
                        width: screenWidth - 50,
                        height: screenHeight - 50,
                      ),
                      //child!,
                    ],
                  )
                ]);
          },
          child: AmbientMode(
            builder: (BuildContext context, WearMode mode, Widget? child) {
              return Text(
                'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_timerStarted) {
      _timer.cancel();
    }

    super.dispose();
  }
}
