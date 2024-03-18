import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.h)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, color: Colors.white))
    ),
  );
}
