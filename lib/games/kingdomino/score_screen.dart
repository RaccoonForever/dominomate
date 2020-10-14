import 'dart:io';

import 'package:domino_mate/home.dart';
import 'package:domino_mate/utils/buttons.dart';
import 'package:domino_mate/utils/constants.dart';
import 'package:domino_mate/utils/containers.dart';
import 'package:flutter/material.dart';
import 'package:domino_mate/games/kingdomino/camera.dart';
import 'package:domino_mate/main.dart';
import 'package:image_picker/image_picker.dart';

import 'package:domino_mate/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';

class ScoreScreenKingDomino extends StatefulWidget {
  @override
  ScoreScreenState createState() {
    return new ScoreScreenState();
  }
}

class ScoreScreenState extends State<ScoreScreenKingDomino> {

  String _score = "N/A";
  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
    ..load()
        ..show(anchorType: AnchorType.bottom);
  }

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(adUnitId: AdManager.bannerAdUnitId, size: AdSize.banner);

    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  _goToCameraScreen() async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePictureScreen(
                  camera: cameras.first,
                )));

    if (result != null) {
      setState(() {
        _score = result.toString();
      });
    }
  }

  _goToGallery() async {
    File galleryFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    String path = galleryFile.path;

    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return PreviewAlertDialog(
            imagePath: path,
            title: "Image preview",
            body: "Is this image correct ?",
          );
        }).then((value) {
      setState(() {
        _score = value.toString();
      });
    });
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
                  flex: 2,
                  child: ScoreScreenContainer(text: "Your score is\n" + _score),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ScoreScreenButton(
                            onPressed: _goToCameraScreen,
                            title: "Take a picture",
                            width: 150,
                            icon: Icon(
                              Icons.camera_enhance,
                              size: 50,
                            ),
                          ),
                          ScoreScreenButton(
                            onPressed: _goToGallery,
                            title: "From gallery",
                            width: 150,
                            icon: Icon(
                              Icons.folder,
                              size: 50,
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        /**decoration: BoxDecoration(
                                color: Colors.lightBlueAccent[100],
                                border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                                style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),*/
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "This application helps you computing KingDomino score ! \n\n"
                              "Choose the source to get the image of your tile board. \n\n Don't forget that the image should be"
                              " as centered as possible and as clean as possible. Any object should be removed from the tiles even the little "
                              "paper castle.",
                              style: TextStyle(
                                  fontSize: CONTAINER_SS_TEXT_SIZE,
                                  color: CONTAINER_SS_TEXT_COLOR,
                                  fontFamily: CONTAINER_SS_FONT_FAMILY),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ))),
              ],
            )));
  }
}
