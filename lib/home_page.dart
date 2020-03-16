import 'dart:async';
import 'dart:convert';
import 'package:compta_app/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'inscription.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

final facebookLogin = FacebookLogin();

bool isSignedIn_google;

void main() async {
  // Set default home.
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = new home_page();
  isSignedIn_google = await _googleSignIn.isSignedIn();
  runApp(new MaterialApp(
    home: _defaultHome,
  ));
}


class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  @override
  Widget build(BuildContext context) {

    return Container(
      child:Column(children: <Widget>[
        SizedBox(height: 100),
      Material(
      color: Colors.transparent,
       child: InkWell(
            onTap: () {_handleSignOut_google(context);

            },
            child: Center(

              child: Text("google SignOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Bold",
                      fontSize: 16,
                      letterSpacing: 1.0)),
            )
        ),),
        SizedBox(height: 100),

        Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () {
                facebook_logout(context);
              },
              child: Center(

                child: Text("facebook SignOut",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Poppins-Bold",
                        fontSize: 16,
                        letterSpacing: 1.0)),
              )
          ),),
      ],)
    );
  }
}

Future<void> _handleSignOut_google(BuildContext context) async {
  await _googleSignIn.signOut().then((value) => Navigator.pop(context));}

Future<void> facebook_logout(BuildContext context) async { await facebookLogin.logOut().then((value) => Navigator.pop(context));

}

