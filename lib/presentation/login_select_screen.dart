import 'package:flutter/material.dart';
import 'package:mind_pro/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSelectScreen extends StatelessWidget {
  const LoginSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check, if the user is already logged in, see AD-23
    SharedPreferences.getInstance().then((value) => {
          if (value.containsKey(Const.sharedPrefJWTTokenName))
            {
              // user is already logged in, because he has a JWT token from the backend
              // TODO: goto other screen
            }
        });

    return Container();
  }
}
