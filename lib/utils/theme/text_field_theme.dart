import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTextFieldTheme{
  KTextFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white38
        ),
    ),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white38
        )
    ),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white38
        )
    )
  );
}