import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:chess_game/views/game_setup/widgets/game_setting_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class DifficultyRadio extends StatelessWidget {
  const DifficultyRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameSetupController>();
    final List<String> difficulties = ["Easy", "Medium", "Hard"];

    return Column(
      children: [
        Text("Game Difficulty", style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
        ),),
        Wrap(
          spacing: 16.w,
          children: List.generate(difficulties.length, (index) => GameSettingRadio(
              value: index,
              label: difficulties[index], groupValue: controller.gameDifficulty)
          )
        )
      ],
    );
  }
}
