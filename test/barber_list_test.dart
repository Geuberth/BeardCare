import 'package:beardcare/models/barbers.dart';
import 'package:beardcare/providers/barbers_provider.dart';
import 'package:beardcare/screens/barber_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:network_image_mock/network_image_mock.dart';

late BarbersProvider barbersList;

Widget createBarberListScreen() => ChangeNotifierProvider<BarbersProvider>(
      create: (context) {
        barbersList = BarbersProvider();
        return barbersList;
      },
      child: const MaterialApp(
        home: BarberListPage(),
      ),
    );

void addItems() {
  barbersList.fillWithList([
    Barber(id: 1, name: 'Jhon', description: 'Starter pack', qualification: 5),
    Barber(
        id: 1, name: 'Elvis', description: 'The new paint', qualification: 4),
    Barber(
        id: 1, name: 'Patricio', description: 'The newcomer', qualification: 3),
  ]);
}

void main() {
  group('Test Barber List Page', () {
    testWidgets('Testing Jhon Exists', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createBarberListScreen());
        addItems();
        await tester.pumpAndSettle();
        expect(find.text('Jhon'), findsOneWidget);
      });
    });
  });
}
