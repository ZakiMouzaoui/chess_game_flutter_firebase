import 'package:get/get.dart';

class GameSetupController extends GetxController{
  Rx<bool> isVersusAi = true.obs;
  Rx<String> timeType = "Bullet 1|0".obs;
  Rx<int> gameDifficulty = 1.obs;
  Rx<bool> isWhite = true.obs;
}