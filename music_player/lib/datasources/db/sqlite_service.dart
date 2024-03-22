import 'package:music_player/datasources/db/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, "myapp.db"), onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT,  description TEXT NOT NULL)",
      );
    }, version: 1);
  }

  Future<int> createItem(Note note) async {
    final db = await initDB();
    final id = await db.insert("Notes", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Note>> getNotes() async {
    final db = await initDB();
    final queryResult = await db.query("Notes");
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }
}
