import 'package:flutter/material.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/views/game_view.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GAME_TITLE),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildGameTitle(),
              _buildOnePlayerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildGameTitle() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 40),
      child: Text(
        GAME_TITLE,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  RaisedButton _buildOnePlayerButton() {
    return RaisedButton(
      onPressed: _onePlayer,
      child: Text(START_GAME),
    );
  }

  void _onePlayer() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameView()),
    );
  }
}
