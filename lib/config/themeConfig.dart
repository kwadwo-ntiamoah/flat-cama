import 'package:flutter/material.dart';

import 'colors.dart';

class KTextTheme {
  static TextTheme textTheme = TextTheme(
      displayLarge: TextStyle(
          fontSize: 20.5,
          fontWeight: FontWeight.w700,
          color: KColors.kTextColorDark),
      bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: KColors.kTextColorLight));
}

class InpBorder {
  static InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: KColors.kTextColorLight, width: 1));
}

class TextFieldTheme {
  static InputDecorationTheme textFieldTheme = InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      enabledBorder: InpBorder.inputBorder,
      focusedBorder: InpBorder.inputBorder,
      errorBorder: InpBorder.inputBorder
          .copyWith(borderSide: BorderSide(color: KColors.kPrimaryColor)));
}