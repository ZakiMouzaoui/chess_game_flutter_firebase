enum PieceType { pawn, knight, bishop, rook, queen, king }

class PieceModel{
  final PieceType type;
  final bool isWhite;

  const PieceModel({required this.type, required this.isWhite});
}