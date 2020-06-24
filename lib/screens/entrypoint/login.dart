import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sundayservice/app.dart';
import 'package:sundayservice/services/authService.dart';

import '../../home.dart';

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
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();
  bool _success;
  String _userEmail;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

// Example code for registration.
  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: emailEditController.text,
      password: passwordEditController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        ios: (_) => CupertinoNavigationBarData(
          heroTag: "loginPage",
          transitionBetweenRoutes: false,
          leading: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
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
              PlatformTextField(
                textInputAction: TextInputAction.next,
                controller: emailEditController,
                focusNode: _emailFocus,
                onSubmitted: (term) {
                  _fieldFocusChange(context, _emailFocus, _passwordFocus);
                },
                android: (_) => MaterialTextFieldData(
                    decoration: InputDecoration(
                  hintText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  icon: Icon(Icons.mail_outline),
                )),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "Email",
                  prefix: Icon(Icons.mail_outline),
                ),
              ),
              SizedBox(height: 20),
              PlatformTextField(
                textInputAction: TextInputAction.done,
                controller: passwordEditController,
                obscureText: true,
                focusNode: _passwordFocus,
                onSubmitted: (term) {
                  _passwordFocus.unfocus();
                },
                android: (_) => MaterialTextFieldData(
                    decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock_outline),
                )),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "Password",
                  prefix: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(height: 20),
              PlatformButton(
                child: PlatformText('LOGIN'),
                onPressed: () async {
                  var result = await authenticationService.loginWithEmail(
                      email: emailEditController.text,
                      password: passwordEditController.text);
                  if (result is bool) {
                    if (result) {
                      Navigator.pushReplacement(
                        context,
                        platformPageRoute(
                            builder: (BuildContext context) {
                              return MainApp();
                            },
                            context: context),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
