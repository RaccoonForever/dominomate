import 'package:board_game_mate/home.dart';
import 'package:board_game_mate/utils/buttons.dart';
import 'package:board_game_mate/utils/constants.dart';
import 'package:board_game_mate/utils/containers.dart';
import 'package:flutter/material.dart';
import 'package:board_game_mate/games/kingdomino/camera.dart';
import 'package:board_game_mate/main.dart';

class ScoreScreenKingDomino extends StatefulWidget {
  @override
  ScoreScreenState createState() {
    return new ScoreScreenState();
  }
}

class ScoreScreenState extends State<ScoreScreenKingDomino> {
  String _score = "";

  _goToCameraScreen(BuildContext context) async {
    final dataFromPrediction = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePictureScreen(
                  camera: cameras.first,
                )));

    _score = dataFromPrediction.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: buildBackground(),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: EmptySpace(),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: BACKGROUND_COLOR_2,
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              }),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/img/crown.png"))),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: EmptySpace(),
                        )
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ScoreScreenButton(
                            onPressed: null,
                            title: "Take a picture",
                            width: 150,
                            icon: Icon(Icons.camera_enhance, size: 50,),
                          ),
                          ScoreScreenButton(
                            onPressed: null,
                            title: "From gallery",
                            width: 150,
                            icon: Icon(Icons.folder, size: 50,),
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: ScoreScreenContainer(
                    text: "Your score \n"
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent[100],
                          border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "This application helps you computing King Domino score ! \n\n"
                              "Choose the source to get the image of your tile board. \n\n Don't forget that the image should be"
                              " as centered as possible and as clean as possible. Any object should be on the tiles even the little "
                              "castle construction.",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ))),
              ],
            )));
  }
}
