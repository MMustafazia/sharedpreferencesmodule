import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screens/home.dart';
import 'package:sharedpreferences/screens/lockscreen.dart';
import 'package:sharedpreferences/screens/splash.dart';

class HomeSS22 extends StatefulWidget {
  const HomeSS22({super.key});

  @override
  State<HomeSS22> createState() => _HomeSS22State();
}

class _HomeSS22State extends State<HomeSS22> {
  static const String KEY = "VALUE";
  TextEditingController spController = new TextEditingController();
  var textValue = "No value RN";
  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                var sharedpref = await SharedPreferences.getInstance();
                sharedpref.setBool(SplashScreenState.KEY, false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LockScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "welcome,  " + textValue,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var shredpref = await SharedPreferences.getInstance();
    var getV = shredpref.getString(HomeSSState.KEY.toString());
    textValue = getV != null ? getV : "No value Saved";
    setState(() {});
  }
}
