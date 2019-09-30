import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

// Themes
final materialThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  accentColor: Colors.blue,
  appBarTheme: AppBarTheme(color: Colors.blue.shade600),
  primaryColor: Colors.blue,
  secondaryHeaderColor: Colors.blue,
  canvasColor: Colors.red,
  backgroundColor: Colors.red,
  textTheme: TextTheme().copyWith(body1: TextTheme().body1)
);

final cupertinoTheme = ThemeData(
  primaryColor: Colors.blue,
  backgroundColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white
);


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      home: MyHomePage(title: 'Flutter Platform Aware Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getPage(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        backgroundColor: Colors.blue,
          items: [
        BottomNavigationBarItem(
          icon:  Icon(Icons.business, color: Colors.grey),
          title:  Text('Screen 1', style: bottomNavTextStyle),
          activeIcon:  Icon(Icons.business, color: Colors.white),
        ),
        BottomNavigationBarItem(
          icon:  Icon(Icons.person, color: Colors.grey),
          title:  Text('Screen 2', style: bottomNavTextStyle),
          activeIcon:  Icon(Icons.person, color: Colors.white),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note, color: Colors.grey),
          title: Text(
            'Screen 3',
            style: bottomNavTextStyle,
          ),
          activeIcon:  Icon(Icons.note, color: Colors.white),
        )
      ]),
    );
  }

  Widget getPage(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return Screen2();
      case 2:
        return Screen3();
      default:
        return Screen1();
    }
  }
}