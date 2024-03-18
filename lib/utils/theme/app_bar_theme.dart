import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppBarTheme{
  KAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
    )
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 16.sp,
      ),
  );
}