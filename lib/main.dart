import 'package:beardcare/models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/choose_screen.dart';
import 'screens/login_screen.dart';
import 'screens/worker_profile.dart';
import 'screens/barber_list.dart';
import 'screens/worker_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
      ],
      child: MaterialApp(
        title: 'Beard&Care',
        theme: ThemeData(
          primaryColor: Colors.amber,
          //colorScheme: ColorScheme(primary: ,secondary: ,error: ,background: ,brightness: ,onPrimary: ,onSecondary: ,onSurface: ,onError: ),
        ),
        initialRoute: '/',
        routes: {
          '/WorkerProfile': (context) => const WorkerProfile(),
          '/LoginClient': (context) => const LoginScreen(
                userType: 'Client',
              ),
          '/LoginBarber': (context) => const LoginScreen(
                userType: 'Barber',
              ),
          '/Choose': (context) => const ChooseScreen(),
          '/BarberList': (context) => const BarberListPage(),
          '/WorkerForm': (context) => const WorkerFormPage(),
          '/': (context) => const ChooseScreen(),
        },
      ),
    );
  }
}
