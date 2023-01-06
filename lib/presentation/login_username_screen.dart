import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';

class LoginUsernameScreen extends StatefulWidget {
  const LoginUsernameScreen({Key? key}) : super(key: key);

  @override
  State<LoginUsernameScreen> createState() => _LoginUsernameScreenState();
}

class _LoginUsernameScreenState extends State<LoginUsernameScreen> {
  GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 8,
                  ),
                  Container(
                      width: screenWidth - 50,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter secure password'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                  hintText:
                                      'Enter valid mail id as abc@gmail.com'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter your secure password'),
                            ),
                          ),
                        ],
                      )),

                  /// see aslo: https://www.flutterbeads.com/button-with-icon-and-text-flutter/
                  ElevatedButton.icon(
                    // <-- ElevatedButton
                    onPressed: () {},

                    style: MSBackgrounds.createButtonStyle(context),
                    icon: const Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 24.0,
                    ),
                    label: const Text('Login'),
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
