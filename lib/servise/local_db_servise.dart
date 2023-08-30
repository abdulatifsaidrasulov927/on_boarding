import 'package:on_boarding/model/user_model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? database;
  String tableName = "users";
  // String firstName = "first_name";
  // String lastName = "last_name";
  // String age = "age";
  // String gender = "gender";
  // String job = "job";

  LocalDatabase();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    print("Database ochish uchun harakat boshlandi");

    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}users.db';
    print("Databasening manzili $dbPath");

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    print("Database ochildi");
    print("Database ochiqmi:   ${database.isOpen}");

    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "first_name TEXT,"
        "last_name TEXT,"
        "age TEXT,"
        "gender TEXT,"
        "job TEXT"
        ")");
  }

  Future addUser(UserModel user) async {
    Database db = await getDb();
    var id = await db.insert(tableName, user.toJson());
    print("user $id bilan databsega saqlandi");
  }
}
