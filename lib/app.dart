import 'package:flutter/material.dart';
import 'package:sundayservice/tabNavigator.dart';

import 'bottomNavigation.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  TabItem _currentTab = TabItem.sermons;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.sermons: GlobalKey<NavigatorState>(),
    TabItem.events: GlobalKey<NavigatorState>(),
    TabItem.giving: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.sermons) {
            // select 'main' tab
            _selectTab(TabItem.sermons);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.sermons),
          _buildEventsOffstageNavigator(TabItem.events),
          _buildGivingOffstageNavigator(TabItem.giving),
          _buildSettingsOffstageNavigator(TabItem.settings),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildEventsOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: EventsTabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildGivingOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: GivingTabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildSettingsOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: SettingsTabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}