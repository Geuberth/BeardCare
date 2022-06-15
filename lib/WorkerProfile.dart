import 'package:flutter/material.dart';

class WorkerProfile extends StatefulWidget {
  static String id = 'Login';
  const WorkerProfile({Key? key}) : super(key: key);

  @override
  State<WorkerProfile> createState() => _WorkerProfile();
}

class _WorkerProfile extends State<WorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Beard&Care',style: TextStyle(color: Colors.amber),),
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LoginClient');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.amber,
              ))),
    );
  }
}
