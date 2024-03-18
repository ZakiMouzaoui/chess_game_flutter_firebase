import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class GameSettingRadio extends StatelessWidget {
  const GameSettingRadio({super.key, required this.label, required this.groupValue, required this.value});

  final String label;
  final Rx groupValue;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => groupValue.value = value,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                    () => SizedBox(
                  width: 16.w,
                  child: Radio(value: value, groupValue: groupValue.value, onChanged: (_){
                    groupValue.value = value;
                  }),
                ),
              ),
              SizedBox(width: 8.w,),
              Text(label)
            ],
          ),
        ),
      ],
    );
  }
}
