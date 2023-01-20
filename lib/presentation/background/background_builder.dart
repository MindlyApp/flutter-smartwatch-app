import 'package:flutter/material.dart';

class MSBackgrounds {
  static BoxDecoration createBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 1.0],
      colors: [
        Color(0xFF160068),
        Color(0xFFFB04FC),
      ],
    ));
  }

  static MaterialStateProperty<Color?>? createButtonBackground(
      BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFB04FC);

          /// return Theme.of(context).colorScheme.primary.withOpacity(0.5);
        } else {
          return const Color(0xFFFB04FC);
        }
      },
    );
  }

  static ButtonStyle createButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MSBackgrounds.createButtonBackground(context),
    );
  }

  static MaterialStateProperty<Color?>? createMainMenuButtonBackground(
      BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return const Color(0x00FB04FC);
      },
    );
  }

  static ButtonStyle createMainMenuButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MSBackgrounds.createMainMenuButtonBackground(context),
    );
  }
}
