import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/services/authService.dart';

import '../../app.dart';
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
  textTheme: TextTheme().copyWith(body1: TextTheme().body1),
);
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fNameEditController = TextEditingController();
  final lNameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();

  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

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
          heroTag: "signupPage",
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
                controller: fNameEditController,
                focusNode: _fNameFocus,
                onSubmitted: (term) {
                  _fieldFocusChange(context, _fNameFocus, _lNameFocus);
                },
                android: (_) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    icon: Icon(Icons.person_outline),
                  ),
                ),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "First Name",
                  prefix: Icon(Icons.person_outline),
                ),
              ),
              SizedBox(height: 20),
              PlatformTextField(
                textInputAction: TextInputAction.next,
                controller: lNameEditController,
                focusNode: _lNameFocus,
                onSubmitted: (term) {
                  _fieldFocusChange(context, _lNameFocus, _emailFocus);
                },
                android: (_) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    icon: Icon(Icons.person_outline),
                  ),
                ),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "Last Name",
                  prefix: Icon(Icons.person_outline),
                ),
              ),
              SizedBox(height: 20),
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
                    icon: Icon(Icons.mail_outline),
                  ),
                ),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "Email",
                  prefix: Icon(Icons.mail_outline),
                ),
              ),
              SizedBox(height: 20),
              PlatformTextField(
                textInputAction: TextInputAction.done,
                controller: passwordEditController,
                focusNode: _passwordFocus,
                obscureText: true,
                onSubmitted: (value) {
                  _passwordFocus.unfocus();
//                  _calculator();
                },
                android: (_) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    icon: Icon(Icons.lock_outline),
                  ),
                ),
                ios: (_) => CupertinoTextFieldData(
                  placeholder: "Password",
                  prefix: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(height: 20),
              PlatformButton(
                child: PlatformText('REGISTER'),
                onPressed: () async {
                  var result = await authenticationService.signUpWithEmail(
                      email: emailEditController.text,
                      password: passwordEditController.text);

                  if (result is bool) {
                    if (result) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MainApp()),
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
