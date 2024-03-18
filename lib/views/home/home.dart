import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:chess_game/views/auth/login/login.dart';
import 'package:chess_game/views/game_screen/game_screen.dart';
import 'package:chess_game/views/game_setup/game_setup.dart';
import 'package:chess_game/views/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameSetupController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chess Game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Center(
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h
            ),
            children: [
              CardWidget(label: "Player vs AI", icon: Icons.computer_rounded, onTap: (){
                Get.to(()=> const GameSetup());
                controller.isVersusAi.value = true;
              }),
              CardWidget(label: "Player vs Player", icon: Icons.person, onTap: (){
                Get.to(()=>const Login());
                controller.isVersusAi.value = false;
              }),
              CardWidget(label: "Settings", icon: Icons.settings_rounded,),
              CardWidget(label: "About", icon: Icons.info_outline,),
            ],
          )
        ),
      ),
    );
  }
}
