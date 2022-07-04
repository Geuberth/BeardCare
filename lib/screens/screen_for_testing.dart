import 'package:beardcare/models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);
  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Username'),
            onChanged: (value){
              var user = context.read<User>();
              user.username = value;
            },
          ),
          MaterialButton(
              color: Colors.amber,
              child: const Text('Lets go'),
              onPressed: () {
                Navigator.pushNamed(context, '/BarberList');
              })
        ],
      ),
    );
  }
}
