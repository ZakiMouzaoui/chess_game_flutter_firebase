import 'package:chess_game/utils/theme/app_bar_theme.dart';
import 'package:chess_game/utils/theme/elevated_button_theme.dart';
import 'package:chess_game/utils/theme/outlined_button_theme.dart';
import 'package:chess_game/utils/theme/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
      )
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    scaffoldBackgroundColor: ThemeData.dark().primaryColor,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: KTextFieldTheme.inputDecorationTheme
  );
}