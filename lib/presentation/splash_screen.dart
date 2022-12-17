import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}) : super();

  @override
  Widget build(BuildContext context) {
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
}
