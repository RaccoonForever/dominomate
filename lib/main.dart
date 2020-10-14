import 'package:domino_mate/utils/containers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:domino_mate/home.dart';
import 'dart:async';

import 'package:domino_mate/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print("Erreur initialisation caméras");
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initAdMob(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return Container(
            decoration: buildBackground(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: EmptySpace(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/home/castle.png")
                        )
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: buildLogo(),
                ),
                Expanded(
                  flex: 3,
                  child: buildGoToGameButton(context),
                ),
                Expanded(
                  flex: 3,
                  child: buildUnderButton(),
                ),
                Expanded(
                  flex: 1,
                  child: buildBottomBar(context),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
