import 'package:test/test.dart';
import 'package:beardcare/models/user.dart';

void main() {
  group('Testing User Model', () {
    var user = User();

    test('Change name of the User', () {
      user.username = 'Geuberth';
      expect(user.username == 'Geuberth', true);
    });
  });
}