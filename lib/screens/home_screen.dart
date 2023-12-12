import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> ints = [0, 1, 2, 3, 4, 5];
  List<String> words = ["leading", "title", "action", "appbar"];

  late int number = 0;
  late bool understand = false;
  late String word = "Blank";

  late Map<String, Object> data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      number = prefs.getInt("number") ?? 0;
      understand = prefs.getBool("understand") ?? false;
      word = prefs.getString("word") ?? "blank";

      var dataString = prefs.getString("data");
      data = dataString != null
          ? Map<String, Object>.from(jsonDecode(dataString))
          : {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared preferences"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              customRow(number, updateNumber, "Number"),
              SizedBox(
                height: 40,
              ),
              customRow(understand, updateUnderstand, "Understand"),
              SizedBox(
                height: 40,
              ),
              customRow(word, updateWord, "Word"),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: customRow(data, updateData, "Data")),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${data[number]}"),
                  Text("${data[understand]}"),
                  Text("${data[word]}"),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    clearData();
                  });
                },
                child: Text("Clear Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row customRow(data, Function()? onPressed, String buttonText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${data}"),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }

  void updateNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final rnd = Random().nextInt(ints.length);
      number = ints[rnd];
      prefs.setInt("number", number);
    });
  }

  void updateUnderstand() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      understand = !understand;
      prefs.setBool("understand", understand);
    });
  }

  void updateWord() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final rnd = Random().nextInt(words.length);
      word = words[rnd];
      prefs.setString("word", word);
    });
  }

  void updateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final updatedData = {
      "number": number,
      "understand": understand,
      "word": word,
    };
    if (!mapEquals(data, updatedData)) {
      setState(() {
        data = updatedData;
      });
    }

    prefs.setString("data", jsonEncode(data));
  }

  void clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
