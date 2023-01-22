import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:mind_pro/domain/usecases/login_usecases.dart';
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
  late int startTime;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    startTime = DateTime.now().millisecondsSinceEpoch;

    return FutureBuilder(
        future: Future.wait<dynamic>([Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
          GetIt.I.allReady(timeout: const Duration(seconds: 3)),
          GetIt.I.get<LoginUseCases>().isLoggedIn()
        ]),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            /// calculate the remaining time, so that the splash screen is shown
            /// not more than 1.5 seconds
            int endTime = DateTime.now().millisecondsSinceEpoch;
            int timeDiff = endTime - startTime;
            int timerTime = 1500 - timeDiff;

            // the timer time cannot be negative
            if (timerTime < 1) {
              timerTime = 1;
            }

            // after 1,5 seconds goto login screen, see AD-25
            _timer = Timer(Duration(milliseconds: timerTime), () {
              /// GetIt.I.get<LoginUseCases>().isLoggedIn()
              bool loggedIn = snapshot.data![2];
              if (loggedIn == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main-menu', ModalRoute.withName('/main-menu'));
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', ModalRoute.withName('/login'));
              }
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
