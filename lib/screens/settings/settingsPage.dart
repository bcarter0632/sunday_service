import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/main.dart';
import 'package:sundayservice/tabNavigator.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("Settings"),
        ios: (_) => CupertinoNavigationBarData(
          heroTag: 'settingsPage',
          transitionBetweenRoutes: false,
        ),
      ),
      body: Material(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    CupertinoIcons.clear_circled_solid,
                    size: 25,
                  ),
                  title: PlatformText("Sign Out"),
                  onTap: () {
                    _signOut();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                        ModalRoute.withName('/'));
                  },
                ),
                Divider(
                  color: Colors.black.withOpacity(0.10),
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
