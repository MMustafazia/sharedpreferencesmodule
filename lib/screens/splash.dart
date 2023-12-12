import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screens/home.dart';
import 'package:sharedpreferences/screens/lockscreen.dart';

//import 'package:go_global/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEY = "login";
  @override
  void initState() {
    super.initState();
    whereToGO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/git.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                "Shared Pref",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void whereToGO() async {
    var sharepref = await SharedPreferences.getInstance();
    var isLoggedIn = sharepref.getBool(KEY);

    Timer(Duration(seconds: 5), () {
      if (isLoggedIn != null) {
        if (isLoggedIn == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeSS(),
              ));
        } else if (isLoggedIn == false) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LockScreen(),
              ));
        } else {
          print("error");
        }
        ;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LockScreen(),
            ));
      }
    });
  }
}
