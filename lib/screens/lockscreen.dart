import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screens/home.dart';
import 'package:sharedpreferences/screens/splash.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 300,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 280,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black, // Shadow color
                          offset: Offset(0, 3), // Shadow position
                          blurRadius: 5, // Shadow blur radius
                          spreadRadius: 0, // Shadow spread radius
                        ),
                      ],
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(12)),
                )
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/git.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 350,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey.shade300)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 430,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black, // Shadow color
                          offset: Offset(0, 2), // Shadow position
                          blurRadius: 3, // Shadow blur radius
                          spreadRadius: 0, // Shadow spread radius
                        ),
                      ],
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                      onPressed: () async {
                        var sharedpref = await SharedPreferences.getInstance();
                        sharedpref.setBool(SplashScreenState.KEY, true);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => HomeSS()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.grey.shade300, fontSize: 20),
                      )),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.copyright_outlined,
                        size: 20,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text(
                        "All rights reserved by Mustafa Zia",
                        style: TextStyle(
                            color: Colors.grey.shade300, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void gradient() {
    Paint().shader = LinearGradient(
      colors: <Color>[Colors.black, Colors.red],
    ).createShader(Rect.fromLTRB(0, 0, 200, 70));
  }
}
