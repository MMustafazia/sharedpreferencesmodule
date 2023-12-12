import 'package:flutter/material.dart';
import 'package:sharedpreferences/screens/lockscreen.dart';

class wowscreen extends StatefulWidget {
  @override
  State<wowscreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<wowscreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Slider with Screens'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3, // Change this to the number of screens you want
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return LockScreen();
            case 1:
              return SecondScreen();
            case 2:
              return ThirdScreen();
            default:
              return Container(); // Placeholder for additional screens
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the next page
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'First Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Second Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Third Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
