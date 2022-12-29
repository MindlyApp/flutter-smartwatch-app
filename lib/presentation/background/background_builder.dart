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
          return Theme.of(context).colorScheme.primary.withOpacity(0.5);
        } else {
          return const Color(0xFFFB04FC);
        }

        /// fallback to default button color
        return null; // Use the component's default.
      },
    );
  }

  static ButtonStyle createButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MSBackgrounds.createButtonBackground(context),
    );
  }
}
