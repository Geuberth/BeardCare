import 'package:flutter/material.dart';
import 'ChooseScreen.dart';
import 'LoginScreen.dart';
import 'WorkerProfile.dart';
import 'barber_list.dart';
import 'worker_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beard&Care',
      theme: ThemeData(
        primaryColor: Colors.amber,
        //colorScheme: ColorScheme(primary: ,secondary: ,error: ,background: ,brightness: ,onPrimary: ,onSecondary: ,onSurface: ,onError: ),
      ),
      initialRoute: '/',
      routes: {
        '/WorkerProfile': (context) => WorkerProfile(),
        '/LoginClient': (context) => LoginScreen(userType: 'Client',),
        '/LoginBarber': (context) => LoginScreen(userType: 'Barber',),
        '/Choose': (context) => ChooseScreen(),
        '/BaberList': (context) => BarberListPage(),
        '/WorkerForm': (context) => WorkerFormPage(),
        '/': (context) => ChooseScreen(),
      },
    );
  }
}
