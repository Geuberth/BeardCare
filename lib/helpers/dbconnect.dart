import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:beardcare/models/barbers.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'beardcare.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE barbers(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT, qualification INT)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertBarber(List<Barber> barbers) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var barber in barbers) {
      result = await db.insert('barbers', barber.toMap());
    }
    return result;
  }

  Future<List<Barber>> retrieveBarbers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('barbers');
    return queryResult.map((e) => Barber.fromMap(e)).toList();
  }
}