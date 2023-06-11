import 'package:beardcare/models/user.dart';
import 'package:beardcare/providers/barbers_provider.dart';
import 'package:beardcare/screens/barber_list.dart';
import 'package:beardcare/screens/payment.dart';
import 'package:beardcare/screens/success_screen.dart';
import 'package:beardcare/screens/choose_screen.dart';
import 'package:beardcare/screens/register_screen.dart';
import 'package:beardcare/screens/worker_form.dart';
import 'package:beardcare/screens/worker_profile.dart';
import 'package:beardcare/screens/mostrar_citas.dart';
import 'package:beardcare/screens/pick_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp( const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
        ChangeNotifierProvider(create: (context) => BarbersProvider()),
      ],
      child: MaterialApp(
        title: 'Beard&Care',
        theme: ThemeData(
          primaryColor: Colors.amber,
          //colorScheme: ColorScheme(primary: ,secondary: ,error: ,background: ,brightness: ,onPrimary: ,onSecondary: ,onSurface: ,onError: ),
        ),
        initialRoute: '/Choose',
        routes: {
          '/WorkerProfile': (context) => const WorkerProfile(),
          '/PaymentMethods': (context) => const Payment(),
          '/SuccessPayment': (context) => const Success(),
          '/RegisterClient': (context) => const RegisterScreen(
                userType: 'Client',
              ),
          '/RegisterBarber': (context) => const RegisterScreen(
                userType: 'Barber',
              ),
          '/Choose': (context) => const ChooseScreen(),
          '/BarberList': (context) => const BarberListPage(),
          '/WorkerForm': (context) => const WorkerFormPage(),
          '/PickDate': (context) => const DatePickPage(),
          '/Mostrar': (context) => const MostrarPage(),

        },
      ),
    );
  }
}
