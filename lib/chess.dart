import 'package:chess_game/utils/theme/app_theme.dart';
import 'package:chess_game/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ChessGame extends StatelessWidget {
  const ChessGame({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,
        home: const Home(),
      ),
    );
  }
}
