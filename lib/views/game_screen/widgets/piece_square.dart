import 'package:chess_game/models/square_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/piece_model.dart';



class PieceSquare extends StatelessWidget {
  const PieceSquare({super.key, required this.square, required this.isWhite});

  final SquareModel square;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isWhite ? Colors.brown.shade300 : Colors.brown,
      child: InkWell(
        onTap: (){},
        child: square.piece != null ?  Container(
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            _getPieceAsset(square.piece!.type, square.piece!.isWhite),
            color: square.piece!.isWhite ? Colors.white : Colors.black,
          )

        )  : const SizedBox(),
      ),
    );
  }

  String _getPieceAsset(PieceType type, bool isWhite) {
    switch (type) {
      case PieceType.pawn:
        return 'assets/images/pawn.png';
      case PieceType.knight:
        return 'assets/images/knight.png';
      case PieceType.bishop:
        return 'assets/images/bishop.png';
      case PieceType.rook:
        return 'assets/images/rook.png';
      case PieceType.queen:
        return 'assets/images/queen.png';
      case PieceType.king:
        return 'assets/images/king.png';
    }
  }
}


