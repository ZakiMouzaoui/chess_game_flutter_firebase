import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'game_setting_radio.dart';


class PlayerColorRadio extends StatelessWidget {
  const PlayerColorRadio ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameSetupController>();

    final colors = ["White", "Black"];
    return Column(
      children: [
        Text("Play As", style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
        ),),
        Wrap(
            spacing: 16.w,
            children: List.generate(colors.length, (index) => GameSettingRadio(
                value: index == 0,
                label: colors[index], groupValue: controller.isWhite)
            )
        )
      ],
    );
  }
}
