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
import 'package:sundayservice/screens/events/eventsList.dart';
import 'package:sundayservice/screens/giving/tithes.dart';
import 'package:sundayservice/screens/sermons/watchSermonList.dart';
import 'package:sundayservice/screens/settings/settingsPage.dart';

//final materialThemeData = ThemeData(
//    primarySwatch: Colors.blue,
//    scaffoldBackgroundColor: Colors.white,
//    accentColor: Colors.blue,
//    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
//    primaryColor: Colors.blue,
//    secondaryHeaderColor: Colors.blue,
//    canvasColor: Colors.blue,
//    backgroundColor: Colors.red,
//    textTheme: TextTheme().copyWith(body1: TextTheme().body1));
//final cupertinoTheme = CupertinoThemeData(
//    primaryColor: Colors.blue,
//    barBackgroundColor: Colors.blue,
//    scaffoldBackgroundColor: Colors.white);
//
//// Styles
//final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
//final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
//final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);
//
//class SundayServiceMainTab extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return PlatformApp(
//      debugShowCheckedModeBanner: false,
//      android: (_) => MaterialAppData(),
//      ios: (_) => CupertinoAppData(theme: cupertinoTheme),
//      home: SermonWatchListPage(title: 'Sunday Service'),
//    );
//  }
//}
//
//class SermonWatchListPage extends StatefulWidget {
//  SermonWatchListPage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _SermonWatchListPageState createState() => _SermonWatchListPageState();
//}
//
//class _SermonWatchListPageState extends State<SermonWatchListPage> {
//  int _tabIndex = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return PlatformScaffold(
//      appBar: PlatformAppBar(
//        ios: (_) => CupertinoNavigationBarData(
//          title: PlatformText(widget.title),
//          heroTag: 'sermonDetailsPage',
//          transitionBetweenRoutes: false,
//          leading: PlatformButton(
//            padding: EdgeInsets.all(1.0),
//            child: Icon(CupertinoIcons.back, color: Colors.white),
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//          ),
//        ),
//      ),
//      body: getPage(_tabIndex),
//      bottomNavBar: PlatformNavBar(
//          ios: (_) => CupertinoTabBarData(
//                iconSize: 24,
//              ),
//          currentIndex: _tabIndex,
//          itemChanged: (index) {
//            setState(() {
//              _tabIndex = index;
//            });
//          },
//          backgroundColor: Colors.blue,
//          items: [
//            BottomNavigationBarItem(
//              icon: Icon(
//                PlatformIcons(context).videoCamera,
//                color: Colors.grey,
//              ),
//              title: Text('Sermons', style: bottomNavTextStyle),
//              activeIcon: Icon(
//                PlatformIcons(context).videoCamera,
//                color: Colors.white,
//              ),
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(
//                  PlatformIcons(context).time,
//                  color: Colors.grey,
//                ),
//                title: Text('Events', style: bottomNavTextStyle),
//                activeIcon: Icon(
//                  PlatformIcons(context).time,
//                  color: Colors.white,
//                )),
//            BottomNavigationBarItem(
//                icon: Icon(
//                  PlatformIcons(context).book,
//                  color: Colors.grey,
//                ),
//                title: Text(
//                  'Give',
//                  style: bottomNavTextStyle,
//                ),
//                activeIcon: Icon(
//                  PlatformIcons(context).book,
//                  color: Colors.white,
//                )),
//            BottomNavigationBarItem(
//                icon: Icon(PlatformIcons(context).settings, color: Colors.grey),
//                title: Text(
//                  'Settings',
//                  style: bottomNavTextStyle,
//                ),
//                activeIcon: Icon(
//                  PlatformIcons(context).settings,
//                  color: Colors.white,
//                ))
//          ]),
//    );
//  }
//
//  Widget getPage(int tabIndex) {
//    switch (tabIndex) {
//      case 1:
//        return EventsListPage();
//      case 2:
//        return TithesAndOfferingsPage();
//      case 3:
//        return SettingsPage(title: "Settings",);
//      default:
//        return WatchSermonListPage();
//    }
//  }
//}
