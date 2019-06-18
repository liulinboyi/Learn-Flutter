//初始化例子

//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

// //学习的例子
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
//导入相对路径插件
import 'package:path_provider/path_provider.dart';
//设置Placeholder
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(new MyApp());
//获取 SDCard路径

// class MyApp extends StatelessWidget {

//   Future<File> _getLocalFile(String filename) async {
//     String dir = (await getExternalStorageDirectory()).path;
//     File f = new File('$dir/$filename');
//     debugPrint(f.toString());
//     return f;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         title: 'Flutter bottomNavigationBar',
//         theme: new ThemeData.fallback(),
// //加载网络图片
// //      home: Image.network(
// //        'https://upload.jianshu.io/users/upload_avatars/7935065/7a1306bb-6ca4-4bc9-9c7f-10eed04e81b5?imageMogr2/auto-orient/strip|imageView2/1/w/120/h/120',
// //      ),
// //加载 assets图片
//         // home: Image(
//         //   height: 100,
//         //   width: 100,
//         //   image: AssetImage("images/avator.png"),
//         // ));
//         home: FutureBuilder(
//             future: _getLocalFile("Pictures/demo.jpg"),
//             builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//               debugPrint(snapshot.toString());
//               debugPrint(snapshot.data.toString());

//               return snapshot.data != null
//                   ? Image.file(snapshot.data)
//                   : Container();
//             }));
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
                //本地图片占位图
                child: FadeInImage.assetNetwork(
              placeholder: 'images/loading.gif',
              image: 'http://www.devio.org/img/avatar.png',
            )
                //内存图片加载占位图
                // child: FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image: 'http://www.devio.org/img/avatar.png',
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

//计数器 本地存储 实例

// import 'dart:io';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// void main() => runApp(new FileOperationRoute());

// class FileOperationRoute extends StatefulWidget {
//   FileOperationRoute({Key key}) : super(key: key);

//   @override
//   _FileOperationRouteState createState() => new _FileOperationRouteState();
// }

// // //获取 SDCard路径

// // class MyApp extends StatelessWidget {

// class _FileOperationRouteState extends State<FileOperationRoute> {
//   int _counter;

//   @override
//   void initState() {
//     super.initState();
//     //从文件读取点击次数
//     _readCounter().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

//   Future<File> _getLocalFile() async {
//     // 获取应用目录
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     return new File('$dir/counter.txt');
//   }

//   Future<int> _readCounter() async {
//     try {
//       File file = await _getLocalFile();
//       // 读取点击次数（以字符串）
//       String contents = await file.readAsString();
//       return int.parse(contents);
//     } on FileSystemException {
//       return 0;
//     }
//   }

//   Future<Null> _incrementCounter() async {
//     setState(() {
//       _counter++;
//     });
//     // 将点击次数以字符串类型写到文件中
//     await (await _getLocalFile()).writeAsString('$_counter');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text('文件操作')),
//       body: new Center(
//         child: new Text('点击了 $_counter 次'),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ),
//     );
//   }
// }
