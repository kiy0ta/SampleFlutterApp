import 'package:flutter/material.dart';

import 'clock.dart';

class EggTimerPage extends StatelessWidget {
  EggTimerPage(this.image);

  final String image;

  void startTimer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Boiled Egg Time",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/" + image,
              width: 200.0,
              height: 200.0,
            ),
            RaisedButton(
              child: Text("Button"),
              onPressed: () {
                // タイマーをスタートする処理
                startTimer();
              },
              highlightElevation: 16.0,
              highlightColor: Colors.orange,
              onHighlightChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
