import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  Database? database;
  String tableName = "minds";

  LocalDataBase();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    debugPrint('Database started');
    String databasesPath = await getDatabasesPath();

    String dbPath = '${databasesPath}minds.db';
    debugPrint('Database path $dbPath');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    debugPrint('Database created');
    debugPrint('Database isOpen == ${database.isOpen}');

    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT"
        ")");
  }
}
