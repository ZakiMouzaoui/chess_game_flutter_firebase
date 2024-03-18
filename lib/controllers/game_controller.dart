import 'dart:async';

import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:chess_game/utils/constants/strings.dart';
import 'package:get/get.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';
import 'package:bishop/bishop.dart' as bishop;
import 'package:stockfish/stockfish.dart';

import '../utils/helper_functions/helper_functions.dart';

class GameController extends GetxController {
  final setupController = Get.find<GameSetupController>();

  late final Rx<bishop.Game> _game;
  bishop.Game get game => _game.value;

  late final Rx<SquaresState> state;
  late int player =
      setupController.isWhite.isTrue ? Squares.white : Squares.black;
  final aiThinking = false.obs;
  final flipBoard_ = false.obs;

  late final int playerBaseTime;
  late final int incrementalTime;
  late final Rx<int> whiteRemainingTime;
  late final Rx<int> blackRemainingTime;

  Rx<bool> isGameOver = false.obs;

  Timer? whiteTimer;
  Timer? blackTimer;
  late StreamSubscription gameStream;

  bool pauseWhiteTimer = false;
  bool pauseBlackTimer = true;

  Stockfish? stockfish;

  Rx<bool> canPop = false.obs;

  StreamSubscription? stream;
  bool gameOverDialogShowed = false;

  @override
  void onInit() {
    startGame();
    super.onInit();
  }

  Future waitForStockfish() async {
    stockfish = await stockfishAsync();

    String fen = game.fen;
    int level = 800;

    switch (setupController.gameDifficulty.value) {
      case 0:
        level = 800;
      case 1:
        level = 1400;
      case 2:
        level = 2000;
    }
    stockfish!.stdin = "${KStrings.positionFen} $fen";
    stockfish!.stdin = "${KStrings.goMoveTime} $level";
  }

  void listenToSquaresState(SquaresState squaresState) async {
    checkForCheckmate();
    updateTimers(game.turn);

    if (squaresState.state == PlayState.theirTurn && isGameOver.isFalse) {
      onAiMove();
    }
  }

  void startGame() async {
    state = SquaresState.initial(player).obs;
    _game = bishop.Game(variant: bishop.Variant.standard()).obs;
    state.value = game.squaresState(player);
    final timeType = setupController.timeType.split(" ")[1];
    playerBaseTime = int.parse(timeType.split("|")[0]) * 60;
    incrementalTime = int.parse(timeType.split("|")[1]);
    whiteRemainingTime = playerBaseTime.obs;
    blackRemainingTime = playerBaseTime.obs;
    startTimers();
    stockfish = Stockfish();
    gameStream = state.stream.listen(listenToSquaresState);
  }

  void resetGame() async {
    isGameOver.value = false;
    gameStream.resume();
    _game.value = bishop.Game(variant: bishop.Variant.standard());
    player = player == 0 ? 1 : 0;
    state.value = game.squaresState(player);
    gameOverDialogShowed = false;
    pauseWhiteTimer = false;
    pauseBlackTimer = true;
    whiteRemainingTime.value = playerBaseTime;
    blackRemainingTime.value = playerBaseTime;
    aiThinking.value = false;
    startTimers();
    stream?.cancel();
  }

  void onAiMove() async{
    if(stockfish == null){
      await waitForStockfish();
    }

    stream = stockfish!.stdout.listen((event) async {
      if (event.startsWith("bestmove")) {
        final bestMove = event.split(" ")[1];
        game.makeMoveString(bestMove);
        state.value = game.squaresState(player);
        checkForCheckmate();
      }
    });
  }

  void onMove(Move move) {
    game.makeSquaresMove(move);
    state.value = game.squaresState(player);
  }

  void flipBoard() => flipBoard_.toggle();

  void undoMove() {
    if (_game.value.canUndo) {
      _game.value.undo();
      _game.value.undo();
      state.value = game.squaresState(player);
    }
  }

  void updateTimers(int turn) {
    final timer = game.turn == 0 ? blackRemainingTime : whiteRemainingTime;
    timer.value = (timer.value + incrementalTime).clamp(0, playerBaseTime);
    pauseWhiteTimer = turn == 1;
    pauseBlackTimer = turn == 0;
  }

  void startTimers() {
    startTimer(Squares.white, whiteRemainingTime);
    startTimer(Squares.black, blackRemainingTime);
  }

  void startTimer(int color, Rx<int> remainingTime) {
    if (color == Squares.white) {
      whiteTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (!pauseWhiteTimer) {
          remainingTime.value--;
        }
        checkForTimeout(1, whiteRemainingTime.value);
      });
    } else {
      blackTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (!pauseBlackTimer) {
          remainingTime.value--;
        }
        checkForTimeout(0, blackRemainingTime.value);
      });
    }
  }

  void cancelTimers() {
    whiteTimer?.cancel();
    blackTimer?.cancel();
  }

  void disposeResources() {
    stream?.cancel();
    /*
    if (stockfish.state.value == StockfishState.ready) {
      stockfish.dispose();
    }
     */
    cancelTimers();
  }

  void checkForCheckmate() async {
    if (game.checkmate) {
      isGameOver.value = true;
      if (!gameOverDialogShowed) {
        gameOverDialogShowed = true;
        disposeResources();
        await Future.delayed(const Duration(milliseconds: 300));
        KHelperFunctions.showGameOverDialog(
            Get.context!, game.winner!, "checkmate");
      }
      return;
    }
  }

  void checkForTimeout(int turn, int remainingTime) {
    if (remainingTime == 45) {
      isGameOver.value = true;
      disposeResources();
      KHelperFunctions.showGameOverDialog(Get.context!, turn, "timeout");
    }
  }

  @override
  void onClose() {
    disposeResources();
    super.onClose();
  }
}
