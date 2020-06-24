import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/app.dart';
import 'package:sundayservice/screens/entrypoint/login.dart';
import 'package:sundayservice/screens/entrypoint/signup.dart';

import 'home.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown,
//  ]);
  runApp(App());
}

final materialThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blue,
//    canvasColor: Colors.blue,
    backgroundColor: Colors.red,
    textTheme: TextTheme().copyWith(body1: TextTheme().body1));
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: "Sunday Service",
      debugShowCheckedModeBanner: false,
      android: (_) => MaterialAppData(),
      ios: (_) => CupertinoAppData(),
      home: HomePage(title: 'Sunday Service'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _isSignedInAlready() async {
    final FirebaseUser currentUser =
        (await FirebaseAuth.instance.currentUser());

    print(currentUser);
    if (currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    }
//    if (user != null)

//    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
//      email: emailEditController.text,
//      password: passwordEditController.text,
//    ))
//        .user;
//    if (user != null) {
//      setState(() {
//        _success = true;
//        _userEmail = user.email;
//      });
//    } else {
//      _success = false;
//    }
  }

  @override
  initState() {
    _isSignedInAlready();

//    FirebaseAuth.instance
//        .currentUser()
//        .then(
//          (currentUser) => {
//            if (currentUser != null)
//              {
//                Firestore.instance
//                    .collection("users")
//                    .document(currentUser.uid)
//                    .get()
//                    .then(
//                      (DocumentSnapshot result) => Navigator.pushReplacement(
//                        context,
//                        CupertinoPageRoute(
//                            builder: (context) => SermonWatchListPage()),
//                      ),
//                    )
//                    .catchError((err) => print(err))
//              }
//          },
//        )
//        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
//        color: Colors.amber[600],
//        width: 48.0,
//        height: 48.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PlatformButton(
              child: PlatformText('SIGN IN NOW'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
//              androidFlat: (_) => MaterialFlatButtonData(),
//              iosFilled: (_) => CupertinoFilledButtonData(),
            ),
            SizedBox(height: 20),
            PlatformButton(
              child: PlatformText('CREATE AN ACCOUNT'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
//              androidFlat: (_) => MaterialFlatButtonData(),
//              iosFilled: (_) => CupertinoFilledButtonData(),
            ),
          ],
        ),
      ),
    );
  }
}
