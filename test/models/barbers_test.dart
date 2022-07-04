import 'package:beardcare/providers/barbers_provider.dart';
import 'package:beardcare/models/barbers.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Barbers Model', () {
    var barbers = BarbersProvider();
    var barber = Barber(id: 1,name: 'Jhon', description: 'The new instinct', qualification: 5);

    test('A new item should be added', () {
      barbers.add(barber);
      expect(barbers.barbersList.contains(barber), true);
    });

    test('A item should be removed', () {
      barbers.remove(barber);
      expect(barbers.barbersList.contains(barber), false);
    });

    test('fill with a new barber list', () {
      barbers.fillWithList([
        barber,
        barber,
        barber
      ]);
      expect(barbers.barbersList.length == 3, true);
    });
  });
}
