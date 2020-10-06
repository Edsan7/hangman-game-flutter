import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/models/keyboard.dart';

class KeyboardController {
  static List<GameKeyboard> keyboard = [];

  static void initialize() {
    int c = 'a'.codeUnitAt(0);
    keyboard = List<GameKeyboard>.generate(
      KEYBOARD_LENTGH,
      (index) => GameKeyboard(
        index,
        enabled: true,
        symbol: String.fromCharCode(c + index),
      ),
    );
  }
}
