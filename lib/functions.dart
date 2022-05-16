import 'dart:ui';

import 'package:flutter/material.dart';

gradientText(text, color) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [color, Colors.white],
      ).createShader(
        const Rect.fromLTWH(35.0, 0.0, 100.0, 0.0),
        // Offset.zero & bounds.size
      );
    },
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 150, fontWeight: FontWeight.w900, color: Colors.white),
    ),
  );
}

blurShadow(color) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        gradient: RadialGradient(
          radius: 3.5,
          colors: [color, Colors.white],
        )),
    height: 30,
    width: 90,
    child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
            // margin: EdgeInsets.only(top: -100),

            )),
  );
}
