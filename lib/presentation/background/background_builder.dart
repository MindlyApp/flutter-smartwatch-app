import 'package:flutter/widgets.dart';

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
}
