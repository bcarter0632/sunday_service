import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum TabItem { sermons, events, giving, settings }

Map<TabItem, String> tabName = {
  TabItem.sermons: 'Sermons',
  TabItem.events: 'Events',
  TabItem.giving: 'Give',
  TabItem.settings: 'Settings',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.sermons: Colors.red,
  TabItem.events: Colors.green,
  TabItem.giving: Colors.blue,
  TabItem.settings: Colors.orange
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return PlatformNavBar(
//        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(tabItem: TabItem.sermons),
          _buildItem(tabItem: TabItem.events),
          _buildItem(tabItem: TabItem.giving),
          _buildItem(tabItem: TabItem.settings),
        ],
        itemChanged: (index) {
          onSelectTab(
            TabItem.values[index],
          );
//      onTap: (index) => onSelectTab(
//        TabItem.values[index],
//      ),
        print(index);
        });
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.layers;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
