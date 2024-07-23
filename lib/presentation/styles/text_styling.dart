import 'package:flutter/material.dart';


abstract class TextStyling {
  static TextStyle buttonStyleBlack() => const TextStyle(
            letterSpacing: .5,
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600);



  static TextStyle textMedium12() => const TextStyle(
            letterSpacing: .5,
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500
      );
  static TextStyle textMedium14() => const TextStyle(
      letterSpacing: .5,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );
}
