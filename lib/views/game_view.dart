import 'package:flutter/material.dart';
import 'package:hangman_game/controller/game_controller.dart';
import 'package:hangman_game/controller/keyboard_controller.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/dialogs/custom_dialog.dart';
import 'package:hangman_game/helpers/word_generator.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: ${_controller.score.toString()}"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeaderText(),
            _buildTypeWord(),
            _buildImage(),
            _buildLetterBoard(),
            _buildKeyboard(),
          ],
        ),
      ),
    );
  }

  ConstrainedBox _buildHeaderText() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _controller.wrongLetters.length,
          itemBuilder: _buildWrongLetter,
        ),
      ),
    );
  }

  Container _buildTypeWord() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 20),
      child: Text(
        WORD_TYPE.replaceAll('[TYPE]', WordGenerator.wordType),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildWrongLetter(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        _controller.wrongLetters[index] + ' -',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
      _controller.image,
      width: 200,
      height: 200,
      alignment: Alignment.centerLeft,
    );
  }

  Container _buildLetterBoard() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 60),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: GameController.word.length,
            itemBuilder: _buildLetterBlock,
          ),
        ),
      ),
    );
  }

  Widget _buildLetterBlock(context, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(right: 5),
      child: Text(
        _controller.blocks[index].isEnabled
            ? _controller.blocks[index].letter
            : '_',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Expanded _buildKeyboard() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          shrinkWrap: true,
          itemCount: KEYBOARD_LENTGH,
          itemBuilder: _buildCap,
        ),
      ),
    );
  }

  Widget _buildCap(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _send(index),
      child: Container(
        child: Center(
          child: Text(
            KeyboardController.keyboard[index].symbol,
            style: TextStyle(fontSize: 22,  fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: KeyboardController.keyboard[index].enabled
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  void _send(int index) {
    if(!KeyboardController.keyboard[index].enabled) return;
    String hint = KeyboardController.keyboard[index].symbol;
    setState(() {
      _controller.getLetterByPlayer(hint);
      KeyboardController.keyboard[index].enabled = false;
    });
    _checkWinner();
  }

  void _checkWinner(){
    String result = _controller.checkGame();
    if (result.isNotEmpty) {
      _showDialog(result);
    }
  }

  Future _showDialog(String result) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomDialog(
          title: result,
          message: WORD.replaceAll(
            '[WORD]',
            GameController.word,
          ),
          onPressed: _onReset,
        );
      },
    );
  }

  void _onReset() {
    setState(() {
      _controller.reset();
    });
  }
}
