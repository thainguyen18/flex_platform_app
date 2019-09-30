/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flex_platform_app/screens/screen1.dart';
import 'package:flex_platform_app/screens/screen2.dart';
import 'package:flex_platform_app/screens/screen3.dart';
import 'package:flex_platform_app/screens/screen4.dart';

final materialThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blue,
    canvasColor: Colors.blue,
    backgroundColor: Colors.red,
    textTheme: TextTheme().copyWith(body1: TextTheme().body1));
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      android: (_) => MaterialAppData(theme: materialThemeData),
      ios: (_) => CupertinoAppData(theme: cupertinoTheme),
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: toolbarTextStyle,
        ),
        ios: (_) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
          trailing: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                platformPageRoute(builder: (BuildContext context) {
                  return Screen4();
                }, context: context),
              );
            },
          ),
        ),
      ),
      android: (_) => MaterialScaffoldData(
          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            platformPageRoute(builder: (BuildContext context) {
              return Screen4();
            }, context: context),
          );
        },
        tooltip: 'Screen 4',
        child: Icon(Icons.add),
      )),
      body: getPage(_tabIndex),
      bottomNavBar: PlatformNavBar(
          currentIndex: _tabIndex,
          itemChanged: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.grey),
              title: Text('Screen 1', style: bottomNavTextStyle),
              activeIcon: Icon(Icons.business, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              title: Text('Screen 2', style: bottomNavTextStyle),
              activeIcon: Icon(Icons.person, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note, color: Colors.grey),
              title: Text(
                'Screen 3',
                style: bottomNavTextStyle,
              ),
              activeIcon: Icon(Icons.note, color: Colors.white),
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
