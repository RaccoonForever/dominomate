import 'package:domino_mate/home.dart';
import 'package:domino_mate/utils/buttons.dart';
import 'package:domino_mate/utils/constants.dart';
import 'package:domino_mate/utils/containers.dart';
import 'package:flutter/material.dart';

class GameList extends StatefulWidget {
  @override
  GameListState createState() {
    return new GameListState();
  }
}

class GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: buildBackground(),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              /** Back BUTTON */
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: BACKGROUND_COLOR_2,
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  )),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: KingDominoButton(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: QueenDominoButton(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AllDominoButton(),
              ),
            ),
            Expanded(
              flex: 1,
              child: EmptySpace(),
            )
          ],
        ),
      ),
    );
  }
}
