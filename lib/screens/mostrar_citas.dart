
import 'package:flutter/material.dart';


class MostrarPage extends StatefulWidget {
  const MostrarPage({Key? key}) : super(key: key);

  @override
  State<MostrarPage> createState() => _MostrarPageState();
}

class _MostrarPageState extends State<MostrarPage> {

  DateTime today = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Citas pendientes',
          style: TextStyle(color: Colors.amber),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Choose');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 250,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
            child: const Text("La cita es para: 16-JUNIO-2023 12:00 PM"),
          ),
        ],
      ),
    );
  }
}