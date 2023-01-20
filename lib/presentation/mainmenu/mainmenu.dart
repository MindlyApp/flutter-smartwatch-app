import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: WatchShape(
            builder: (BuildContext context, WearShape shape, Widget? child) {
              double screenWidth = MediaQuery.of(context).size.width;
              double screenHeight = MediaQuery.of(context).size.height;

              return Container(
                width: screenWidth,
                height: screenHeight,
                decoration: MSBackgrounds.createBoxDecoration(),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                    ),
                        const Text('Main Menu',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        buildMenuEntries(context),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                    ));
            },
            child: AmbientMode(
              builder: (BuildContext context, WearMode mode, Widget? child) {
                return const Placeholder();
              },
            ),
          )),
    );
  }

  Column buildMenuEntries(BuildContext context) {
    return Column(
      children: [
        buildMenuEntry("Training 1", Icons.people, "/product/relaxation"),
        /// buildMenuEntry("Relaxation", Icons.people, "/product/relaxation"),
        buildMenuEntry("Privacy", Icons.people, "/product/relaxation"),
        buildMenuEntry("Imprint", Icons.people, "/product/relaxation"),
        buildMenuEntry("Logout", Icons.people, "/login/logout"),
      ],
    );
  }

  /// Builds a single menu entry button.
  Widget buildMenuEntry(String title, IconData iconData, String targetScreenPath) {
    return ElevatedButton.icon(
      // <-- ElevatedButton
      onPressed: () {
        Navigator.pushNamed(context, targetScreenPath);
      },
      style: MSBackgrounds.createMainMenuButtonStyle(context),
      icon: Icon(
        iconData,
        size: 24.0,
      ),
      label: Text(title),
    );
  }
}
