import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();

  factory LocalDatabase() => _instance;

  LocalDatabase._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'your_database_name.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            phone number INTEGER
          )
        ''');
      },
    );
  }
}