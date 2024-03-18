import 'package:chess_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squares/squares.dart';


class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameController>();

    return Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: BoardController(
                    state: controller.flipBoard_.value
              ? controller.state.value.board.flipped()
              : controller.state.value.board,
                    playState: controller.state.value.state,
                    pieceSet: PieceSet.merida(),
                    theme: BoardTheme.blueGrey,
                    moves: controller.state.value.moves,
                    onMove: controller.onMove,
                    onPremove: null,
                    labelConfig: LabelConfig.disabled,
                    markerTheme: MarkerTheme(
            empty: MarkerTheme.dot,
            piece: MarkerTheme.corners(),
                    ),
                    promotionBehaviour: PromotionBehaviour.autoPremove,
                  ),
          ),
    );
  }
}
