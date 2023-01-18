import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          double screenWidth = MediaQuery.of(context).size.width;

          /// double screenHeight = MediaQuery.of(context).size.height;

          return Container(
            /// see also: https://www.digitalocean.com/community/tutorials/flutter-flutter-gradient
            decoration: MSBackgrounds.createBoxDecoration(),
            child: Center(
              child: Column(
                /// center the column
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth - 60,
                    child: const Text(
                      'To reset your password please open the Emotivate app on your smartphone.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        },
        child: AmbientMode(
          builder: (BuildContext context, WearMode mode, Widget? child) {
            return const Placeholder();
          },
        ),
      )),
    );
  }
}
