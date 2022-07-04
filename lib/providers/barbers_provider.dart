import 'package:beardcare/models/barbers.dart';
import 'package:flutter/foundation.dart';

class BarbersProvider extends ChangeNotifier {
  late List<Barber> _barbersList = [];

  List<Barber> get barbersList => _barbersList;

  void add(Barber barber) {
    _barbersList.add(barber);
    notifyListeners();
  }

  void fillWithList(List<Barber> newList) {
    _barbersList = newList;
    notifyListeners();
  }

  void remove(Barber barber) {
    _barbersList.remove(barber);
    notifyListeners();
  }
}