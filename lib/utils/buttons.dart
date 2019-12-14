import 'package:domino_mate/games/kingdomino/score_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:domino_mate/utils/constants.dart';

import 'containers.dart';

class HomeButton extends StatelessWidget {
  final Function onPressed;
  final double height;
  final double width;
  final String title;

  const HomeButton(
      {Key key, this.onPressed, this.height, this.width, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: BUTTON_BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
        boxShadow: [
          BoxShadow(
              color: BUTTON_SHADOW_COLOR,
              offset: BUTTON_SHADOW_OFFSET,
              blurRadius: BUTTON_SHADOW_BLUR_RADIUS)
        ],
        border: Border.all(
            color: BUTTON_BORDER_COLOR,
            width: BUTTON_BORDER_WIDTH,
            style: BorderStyle.solid),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: BUTTON_TEXT_SIZE,
                color: BUTTON_TEXT_COLOR,
                fontFamily: 'QuickPencil'),
          ),
        ),
      ),
    );
  }
}

class PreviewButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Icon icon;

  const PreviewButton({Key key, this.onPressed, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BUTTON_BACKGROUND_COLOR,
          borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
          boxShadow: [
            BoxShadow(
                color: BUTTON_SHADOW_COLOR,
                offset: BUTTON_SHADOW_OFFSET,
                blurRadius: BUTTON_SHADOW_BLUR_RADIUS)
          ],
          border: Border.all(
              color: BUTTON_BORDER_COLOR,
              width: BUTTON_BORDER_WIDTH,
              style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: BUTTON_PREVIEW_TEXT_SIZE,
                  fontFamily: CONTAINER_FONT_FAMILY,
                  color: BUTTON_PREVIEW_TEXT_COLOR
                ),
              ),
              icon
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreScreenButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final double width;
  final double height;
  final Icon icon;

  const ScoreScreenButton(
      {Key key, this.onPressed, this.title, this.width, this.height, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: BUTTON_SS_BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(BUTTON_SS_BORDER_RADIUS),
        boxShadow: [
          BoxShadow(
              color: BUTTON_SS_SHADOW_COLOR,
              offset: BUTTON_SS_SHADOW_OFFSET,
              blurRadius: BUTTON_SS_SHADOW_BLUR_RADIUS)
        ],
        border: Border.all(
            color: BUTTON_SS_BORDER_COLOR,
            width: BUTTON_SS_BORDER_WIDTH,
            style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                icon,
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: CONTAINER_FONT_FAMILY,
                      fontSize: BUTTON_SS_TEXT_SIZE,
                      color: BUTTON_SS_TEXT_COLOR),
                )
              ]),
        ),
      ),
    );
  }
}

class KingDominoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: BUTTON_KINGDOMINO_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
            boxShadow: [
              BoxShadow(
                  color: BUTTON_SHADOW_COLOR,
                  offset: BUTTON_SHADOW_OFFSET,
                  blurRadius: BUTTON_SHADOW_BLUR_RADIUS)
            ],
            border: Border.all(
                color: BUTTON_BORDER_COLOR,
                width: BUTTON_BORDER_WIDTH,
                style: BorderStyle.solid)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScoreScreenKingDomino()));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/crown.png"))),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "KingDomino scoring",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: CONTAINER_FONT_FAMILY,
                                    fontSize: CONTAINER_TITLE_TEXT_SIZE,
                                    color: CONTAINER_TEXT_COLOR),
                              ))),
                      Expanded(
                        flex: 7,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "For KingDomino version only. Using AI to compute your score !",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: CONTAINER_FONT_FAMILY,
                                  fontSize: CONTAINER_TEXT_SIZE,
                                  color: CONTAINER_TEXT_COLOR),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QueenDominoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: BUTTON_BACKGROUND_DISABLED_COLOR,
            borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
            boxShadow: [
              BoxShadow(
                  color: BUTTON_SHADOW_COLOR,
                  offset: BUTTON_SHADOW_OFFSET,
                  blurRadius: BUTTON_SHADOW_BLUR_RADIUS)
            ],
            border: Border.all(
                color: BUTTON_BORDER_COLOR,
                width: BUTTON_BORDER_WIDTH,
                style: BorderStyle.solid)),
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    title: "QueenDomino Info",
                    body:
                        "This feature is not available for now ! Stay tuned for an update soon !",
                  );
                });
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/crown-queen.png"))),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "QueenDomino scoring",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: CONTAINER_FONT_FAMILY,
                                    fontSize: CONTAINER_TITLE_TEXT_SIZE,
                                    color: CONTAINER_TEXT_COLOR),
                              ))),
                      Expanded(
                        flex: 7,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "For QueenDomino version. It should work for KingDomino version too, but this function was optimized for QueenDomino !",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: CONTAINER_FONT_FAMILY,
                                  fontSize: CONTAINER_TEXT_SIZE,
                                  color: CONTAINER_TEXT_COLOR),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AllDominoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: BUTTON_BACKGROUND_DISABLED_COLOR,
            borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
            boxShadow: [
              BoxShadow(
                  color: BUTTON_SHADOW_COLOR,
                  offset: BUTTON_SHADOW_OFFSET,
                  blurRadius: BUTTON_SHADOW_BLUR_RADIUS)
            ],
            border: Border.all(
                color: BUTTON_BORDER_COLOR,
                width: BUTTON_BORDER_WIDTH,
                style: BorderStyle.solid)),
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    title: "FullDomino Info",
                    body:
                        "This feature is not available for now ! Stay tuned for an update soon !",
                  );
                });
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "FullDomino scoring",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: CONTAINER_FONT_FAMILY,
                                    fontSize: CONTAINER_TITLE_TEXT_SIZE,
                                    color: CONTAINER_TEXT_COLOR),
                              ))),
                      Expanded(
                        flex: 7,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "For QueenDomino version with Age of Giants or KingDomino version with Age of Giants ! If no giants don't use this one !",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: CONTAINER_FONT_FAMILY,
                                  fontSize: CONTAINER_TEXT_SIZE,
                                  color: CONTAINER_TEXT_COLOR),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
