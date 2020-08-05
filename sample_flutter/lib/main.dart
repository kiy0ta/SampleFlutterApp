import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'package:sample_flutter/egg_timer_page.dart';
import 'dart:async';
import 'clock.dart';

void main() {
  runApp(MyApp());
}

/// アプリ起動時に呼ばれるクラス
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // マテリアルデザインを使用している
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // actionBar、floatingActionButtonの色変更ができる
        // colors.dartに定義してある
        primarySwatch: Colors.orange,
        // おまじない？
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // actionBarに表示するタイトル文言
      // homeは、アプリ起動時に表示するWidgetを設定します
      home: MyHomePage(title: 'Boiled Egg Timer'),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// StatefulWidgetはStateという状態を持つWidgetで動的に変化させることのできるWidgetであるのに対し、 (今回は数字を変化させたい)
/// StatelessWidgetはStateをもたないWidgetであるため動的に変化をさせることができないWidgetとなります(今回はボタン)
class MyHomePage extends StatefulWidget {
  // インスタンス化？
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// カウントアップ処理
class _MyHomePageState extends State<MyHomePage> {
  // ②カウントを示すインスタンス変数
  int _current = 0;

  // ③ カウントダウン処理を行う関数を定義
  void startTimer(boilTime) {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: boilTime), //初期値
      new Duration(seconds: 1), // 減らす幅
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = boilTime - duration.elapsed.inSeconds; //毎秒減らしていく
      });
    });

    // ④終了時の処理
    sub.onDone(() {
      print("Done");
      sub.cancel();
      _current = boilTime;
    });
  }

  /// Scaffoldの中身のウィジェットを定義している
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actionBarのタイトル文言
        // 28行目のインスタンス化のときに引数でわたしている
        // 21行目　home: MyHomePage(title: 'Flutter Demo Home Page')
        // ここでタイトルを変更すると、21行目よりも55行目の文言が上書きされる
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      startTimer(6000);
                    },
                    child: Image.asset(
                      "images/egg_yudetamago.png",
                      width: 200.0,
                      height: 200.0,
                    )),
                GestureDetector(
                    onTap: () {
                      startTimer(4500);
                    },
                    child: Image.asset(
                      "images/egg_yudetamago_hanjuku.png",
                      width: 200.0,
                      height: 200.0,
                    )),
              ],
            ),
            Text(
              'ゆで卵の好みの固さを教えてください',
            ),
            Text(
              "$_current秒",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
