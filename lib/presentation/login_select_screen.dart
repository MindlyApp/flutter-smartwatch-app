import 'package:flutter/material.dart';
import 'package:mind_pro/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: const Center(
            child: Text(
              'Hello Gradient!',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
