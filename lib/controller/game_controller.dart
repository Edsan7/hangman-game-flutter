import 'package:hangman_game/controller/keyboard_controller.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/helpers/image.dart';
import 'package:hangman_game/helpers/word_generator.dart';
import 'package:hangman_game/models/letter_block.dart';

class GameController {
  static String word;
  String image;
  int cont;
  int score;
  List<LetterBlock> blocks = [];
  List<String> wrongLetters = [];

  GameController() {
    initialize();
    score = 0;
  }

  void initialize() {
    KeyboardController.initialize();
    word = WordGenerator.getWord();
    blocks =
        List<LetterBlock>.generate(word.length, (index) => LetterBlock(index));
    _setBlocks(word, blocks);
    cont = 0;
    wrongLetters.clear();
    image = HungmanImage.images[cont];
  }

  void _setBlocks(String value, List<LetterBlock> list) {
    for (int i = 0; i < value.length; i++) {
      list[i].letter = value[i];
    }
  }

  void getLetterByPlayer(String hint) {
    if (!_check(hint)) {
      cont++;
      image = HungmanImage.images[cont];
      wrongLetters.add(hint.toUpperCase());
    } else {
      _setBlockEnabled(hint);
    }
  }

  void _setBlockEnabled(String hint) {
    blocks.forEach((element) {
      if (element.letter == hint) element.isEnabled = true;
    });
  }

  bool _check(String letter) {
    if (word.contains(letter))
      return true;
    else
      return false;
  }

  String checkGame() {
    if (cont == 6)
      return GAME_OVER;
    else if (cont <= 7 && _checkIfAllEnabled()) {
      score++;
      return WIN;
    }
    return '';
  }

  bool _checkIfAllEnabled() {
    for (int i = 0; i < blocks.length; i++) {
      if (!blocks[i].isEnabled) {
        return false;
      }
    }
    return true;
  }

  void reset() => initialize();
}
