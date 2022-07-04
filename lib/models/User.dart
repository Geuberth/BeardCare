import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String _username = '';

  String get username => _username;

  set username(String newValue){
    _username = newValue;
    notifyListeners();
  }
}