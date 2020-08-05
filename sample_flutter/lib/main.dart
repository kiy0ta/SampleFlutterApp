import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // actionBar、floatingActionButtonの色変更ができる
        // colors.dartに定義してある
        primarySwatch: Colors.blue,
        // おまじない？
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // actionBarに表示するタイトル文言
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    // setStateはStateの状態を更新するメソッドになります。
    // 引数の関数を実行した後、Stateのbuildを実行しなおします。
    setState(() {
      _counter++;
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
        title: Text(widget.title),
      ),
      // Center = 中央揃えになる
      // 詳細は「flutter Widget catalog」を参照
      body: Center(
        // Columnは列なので縦にウィジェットが並ぶ、rowは行なので横一列に並ぶ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 42行目のメソッド名
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
