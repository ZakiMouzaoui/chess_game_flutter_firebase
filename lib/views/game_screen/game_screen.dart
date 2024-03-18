import 'package:bishop/bishop.dart';
import 'package:chess_game/controllers/game_controller.dart';
import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:chess_game/utils/constants/strings.dart';
import 'package:chess_game/utils/helper_functions/helper_functions.dart';
import 'package:chess_game/views/game_screen/widgets/chess_board.dart';
import 'package:chess_game/views/game_screen/widgets/player_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final setupController = Get.find<GameSetupController>();
    final controller = Get.put(GameController());

    return PopScope(
      canPop: controller.game.gameOver,
      onPopInvoked: (_) {
        if (!controller.game.gameOver) {
          KHelperFunctions.showExitDialog(context);
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Chest"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final controller = Get.put(GameController());
                  controller.resetGame();
                },
                icon: const Icon(Icons.restart_alt)),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => PlayerTile(
                      name:
                          setupController.isVersusAi.isTrue ? "Bot" : "Player",
                      image: setupController.isVersusAi.isTrue
                          ? KStrings.botImg
                          : KStrings.defaultAvatar,
                      timer: controller.player == 0
                          ? controller.blackRemainingTime.value
                          : controller.whiteRemainingTime.value,
                    )),
                const ChessBoard(),
                Obx(
                  () => PlayerTile(
                    name: "You",
                    image: KStrings.defaultAvatar,
                    rating: 3000,
                    timer: controller.player == 0
                        ? controller.whiteRemainingTime.value
                        : controller.blackRemainingTime.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
