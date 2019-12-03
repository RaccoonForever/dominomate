import 'package:flutter/material.dart';

import 'constants.dart';

class EmptySpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ScoreScreenContainer extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  const ScoreScreenContainer({Key key, this.width, this.height, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CONTAINER_SS_BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(CONTAINER_SS_BORDER_RADIUS),
        border: Border.all(
            color: CONTAINER_SS_BORDER_COLOR,
            width: CONTAINER_SS_BORDER_WIDTH,
            style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                  fontSize: CONTAINER_SS_TITLE_TEXT_SIZE,
                  fontFamily: CONTAINER_SS_FONT_FAMILY,
                  color: CONTAINER_SS_TEXT_COLOR),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatefulWidget {
  final String title;

  const CustomAlertDialog({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CustomAlertDialogState(this.title);
  }
}

class CustomAlertDialogState extends State<CustomAlertDialog> {
  final String title;

  CustomAlertDialogState(this.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0.0),
      content: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/parchemin.png"),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.0), BlendMode.darken))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Text(title, style: TextStyle(color: Colors.white),),
            ),
          )),
    );
  }
}
