import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screens/home2.dart';
import 'package:sharedpreferences/screens/lockscreen.dart';
import 'package:sharedpreferences/screens/splash.dart';

class HomeSS extends StatefulWidget {
  const HomeSS({super.key});

  @override
  State<HomeSS> createState() => HomeSSState();
}

class HomeSSState extends State<HomeSS> {
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
                Text(
                  "Home Screen",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 50,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: TextField(
                          controller: spController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade300)),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
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
                            var textt = spController.text.toString();
                            var pref = await SharedPreferences.getInstance();
                            pref.setString(KEY, textt);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeSS22()));
                          },
                          child: Text(
                            "save",
                            style: TextStyle(
                                color: Colors.grey.shade300, fontSize: 20),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Saved value: " + textValue,
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
    var getV = shredpref.getString(KEY.toString());
    textValue = getV != null ? getV : "No value Saved";
    setState(() {});
  }
}
