import 'package:flutter/material.dart';
import 'animated_button.dart';

class ChooseScreen extends StatefulWidget {
  static String id = 'Choose';
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  bool isPressed = false;
  bool isPressed1 = false;

  void buttonPressed() {
    setState(() {
      isPressed = true;
    });
  }

  void buttonPressed1() {
    setState(() {
      if (isPressed1 == false) {
        isPressed1 = true;
      } else if (isPressed1 == true) {
        isPressed1 = false;
      }
    });
  }

  void redirectPerson() {
    if (isPressed == true) {
      Navigator.pushNamed(context, '/RegisterClient');
    }
    setState(() {
      isPressed = false;
    });
  }

  void redirectBarber() {
    if (isPressed1 == true) {
      Navigator.pushNamed(context, '/RegisterBarber');
    }
    setState(() {
      isPressed1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeuBotton(
                onTap: buttonPressed,
                onTap1: buttonPressed1,
                redirectP: redirectPerson,
                redirectB: redirectBarber,
                isPressed: isPressed,
                isPressed1: isPressed1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}