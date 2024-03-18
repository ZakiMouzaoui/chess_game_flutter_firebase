import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/game_setup_controller.dart';
import '../../../utils/time_setups.dart';
import 'game_setting_radio.dart';


class TimeSetupRadio extends StatelessWidget {
  const TimeSetupRadio({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameSetupController>();

    return Column(
      children: [
        Text("Game Time", style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
        ),),
        Wrap(
            spacing: 16.w,
            runSpacing: 2.h,
            children: TimeSetups.setups.map((e) => GameSettingRadio(value: e, label: e, groupValue: controller.timeType,)).toList()
        )
      ],
    );
  }
}
