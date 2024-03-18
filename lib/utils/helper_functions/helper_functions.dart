import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chess_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../views/home/home.dart';

class KHelperFunctions{
  static void showExitDialog(BuildContext context) async{
    await AwesomeDialog(context: context, body: Column(
      children: [
        Text("Are you sure you want to quit?", style: TextStyle(
            fontSize: 18.sp
        ),),
        SizedBox(height: 8.h,),
        Text("You will lose the game", style: TextStyle(
            fontSize: 16.sp
        ),)
      ],
    ), btnOk: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white
      ),
      onPressed: (){
        Get.find<GameController>().onClose();
        Get.offAll(()=>const Home());
      }, child: const Text("Confirm"),
    ), btnCancel: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.white
      ),
      onPressed: (){
        Get.back();
      }, child: const Text("Cancel"),
    ), dialogType: DialogType.warning, dismissOnTouchOutside: true).show();
  }

  static void showGameOverDialog(BuildContext context, int winner, String winningWay) async{
    final color = winner == 1 ? "Black" : "White";

    await AwesomeDialog(context: context, body: Column(
      children: [
        Text("Game Over", style: TextStyle(
            fontSize: 18.sp
        ),),
        SizedBox(height: 8.h,),
        Text("$color has won by $winningWay", style: TextStyle(
            fontSize: 16.sp
        ),)
      ],
    ), btnOk: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white
      ),
      onPressed: (){
        Get.back();
        Get.find<GameController>().resetGame();
      }, child: const Text("New Game"),
    ), btnCancel: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.white
      ),
      onPressed: (){
        Get.offAll(()=>const Home());
      }, child: const Text("Exit"),
    ), dialogType: DialogType.info, dismissOnBackKeyPress: false, dismissOnTouchOutside: false).show();
  }
}