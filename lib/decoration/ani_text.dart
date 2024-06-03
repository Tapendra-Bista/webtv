import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AnimatedTextKit animatedText(String text, TextStyle style) {
  return AnimatedTextKit(
      stopPauseOnTap: true,
      isRepeatingAnimation: false,
      animatedTexts: [
        TypewriterAnimatedText(
          cursor:'',
          speed: const Duration(milliseconds:200),
          text,
          textStyle: style,
        ),
      ]);
}
