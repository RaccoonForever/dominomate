import 'package:board_game_mate/utils/buttons.dart';
import 'package:board_game_mate/utils/constants.dart';
import 'package:board_game_mate/utils/containers.dart';
import 'package:flutter/material.dart';

import 'gamelist.dart';

var _homeTitleFontFamily = 'Gratisan';
var _homeTitleText = 'Domino \nMate';

BoxDecoration buildBackground() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [BACKGROUND_COLOR_1, BACKGROUND_COLOR_2]));
}

Widget buildLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/home/crown.png"))),
          ),
        ),
      ),
      Expanded(
          flex: 5,
          child: Text(
            _homeTitleText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: TITLE_1_TEXT_SIZE,
                fontFamily: _homeTitleFontFamily,
                color: TITLE_1_TEXT_COLOR_DARK),
          )),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/home/princess.png"))),
          ),
        ),
      )
    ],
  );
}

Widget buildUnderButton() {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/home/tower.png"))),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/home/king.png"))),
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildGoToGameButton(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/home/knight.png"))),
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: HomeButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameList()));
                },
                title: 'Play !',
              ),
            )),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/home/money.png"))),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildBottomBar(context) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: EmptySpace(),
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: Icon(
                Icons.contact_mail,
                color: ICON_COLOR,
                semanticLabel: 'Contact me with my mail',
              ),
            )),
        Expanded(
          flex: 1,
          child: EmptySpace(),
        ),
        Expanded(
          flex: 2,
          child: Container(
              child: IconButton(
                icon: Icon(Icons.info,
                    color: ICON_COLOR,
                    semanticLabel: 'Information about the application'),
                onPressed: () {
                  showDialog(context: context, barrierDismissible: true,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(title: "coucou");
                  });
                },
              )),
        ),
        Expanded(
          flex: 4,
          child: EmptySpace(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              'v0.0.1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: CONTAINER_FONT_FAMILY,
                  color: CONTAINER_TEXT_COLOR),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: EmptySpace(),
        )
      ],
    ),
  );
}
