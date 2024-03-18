import 'package:chess_game/views/game_screen/game_screen.dart';
import 'package:chess_game/views/game_setup/widgets/difficulty_radio.dart';
import 'package:chess_game/views/game_setup/widgets/player_color_radio.dart';
import 'package:chess_game/views/game_setup/widgets/time_setup_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class GameSetup extends StatelessWidget {
  const GameSetup({super.key, this.isAi=true});

  final bool isAi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Game Setup"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const PlayerColorRadio(),
                const Divider(),
                SizedBox(height: 16.h,),
                const TimeSetupRadio(),
                const Divider(),
                SizedBox(height: 16.h,),
                if(isAi) const DifficultyRadio(),
                SizedBox(height: 16.h,),
                ElevatedButton(onPressed: ()=>Get.to(()=>const GameScreen()), child: const Text("Play"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
