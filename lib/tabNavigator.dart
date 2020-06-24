import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sundayservice/screens/events/eventDetails.dart';
import 'package:sundayservice/screens/events/eventsList.dart';
import 'package:sundayservice/screens/giving/tithes.dart';
import 'package:sundayservice/screens/sermons/sermonDetails.dart';
import 'package:sundayservice/screens/sermons/watchSermonList.dart';
import 'package:sundayservice/screens/settings/settingsPage.dart';

import 'bottomNavigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => WatchSermonListPage(

//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        onPush: (materialIndex) =>
//            _push(context, materialIndex: materialIndex),
      ),
      TabNavigatorRoutes.detail: (context) => SermonDetailsPage(
//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        materialIndex: materialIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class EventsTabNavigatorRoutes {
  static const String eventroot = '/event';
  static const String eventdetail = '/eventsdetail';
}

class EventsTabNavigator extends StatelessWidget {
  EventsTabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[EventsTabNavigatorRoutes.eventdetail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      EventsTabNavigatorRoutes.eventroot: (context) => EventsListPage(

//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        onPush: (materialIndex) =>
//            _push(context, materialIndex: materialIndex),
      ),
      EventsTabNavigatorRoutes.eventdetail: (context) => EventDetailsPage(
//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        materialIndex: materialIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: EventsTabNavigatorRoutes.eventroot,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class GivingTabNavigatorRoutes {
  static const String givingroot = '/giving';
  static const String givingdetails = '/givingdetails';
}

class GivingTabNavigator extends StatelessWidget {
  GivingTabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[GivingTabNavigatorRoutes.givingdetails](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      GivingTabNavigatorRoutes.givingroot: (context) => TithesAndOfferingsPage(

//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        onPush: (materialIndex) =>
//            _push(context, materialIndex: materialIndex),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: GivingTabNavigatorRoutes.givingroot,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

class SettingsTabNavigatorRoutes {
  static const String settingsroot = '/settings';
  static const String settingsdetail = '/settingsdetail';
}

class SettingsTabNavigator extends StatelessWidget {
  SettingsTabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[SettingsTabNavigatorRoutes.settingsdetail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      SettingsTabNavigatorRoutes.settingsroot: (context) => SettingsPage(

//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        onPush: (materialIndex) =>
//            _push(context, materialIndex: materialIndex),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: SettingsTabNavigatorRoutes.settingsroot,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}