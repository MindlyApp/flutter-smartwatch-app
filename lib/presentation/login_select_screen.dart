import 'package:flutter/material.dart';
import 'package:mind_pro/const.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wear/wear.dart';

class LoginSelectScreen extends StatelessWidget {
  const LoginSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check, if the user is already logged in, see AD-23
    SharedPreferences.getInstance().then((value) => () {
          if (value.containsKey(Const.sharedPrefJWTTokenName)) {
            // user is already logged in, because he has a JWT token from the backend
            // goto other screen
            Navigator.pushNamed(context, '/main-menu');
          }
        }());

    return Scaffold(
      body: Center(
          child: WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          /// double screenWidth = MediaQuery.of(context).size.width;
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
                  const Text(
                    'Login Method',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 8,
                  ),

                  /// see aslo: https://www.flutterbeads.com/button-with-icon-and-text-flutter/
                  ElevatedButton.icon(
                    // <-- ElevatedButton
                    onPressed: () {},
                    style: MSBackgrounds.createButtonStyle(context),
                    icon: const Icon(
                      Icons.keyboard,
                      size: 24.0,
                    ),
                    label: const Text('Keyboard'),
                  ),
                  ElevatedButton.icon(
                    // <-- ElevatedButton
                    onPressed: () {},

                    style: MSBackgrounds.createButtonStyle(context),
                    icon: const Icon(
                      Icons.qr_code_2,
                      size: 24.0,
                    ),
                    label: const Text('QR Code'),
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
