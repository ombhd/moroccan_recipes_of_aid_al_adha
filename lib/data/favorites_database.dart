import 'package:aid_adha_recipes/models/favorites_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class FavoritesDatabase {
  static final instance = FavoritesDatabase._init();
  static Database? _database;
  FavoritesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    print('hello world');
    String dbPath = 'hello-world';
    try {
      dbPath = await getDatabasesPath();
    } catch (e) {
      print(e);
    }
    // if (dbPath != null)
    print("dbPath = [$dbPath]");

    final path = dbPath + "/" + dbName;
    print("dbPath = [$dbPath] and path = [$path]");
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $favoritesTable (
      ${FavoritesFields.id} $idType,
      ${FavoritesFields.idsStringList} $textType
    )
    ''');
  }

  Future<Favorites> create(Favorites favs) async {
    final db = await instance.database;
    /*final id = */ await db.insert(favoritesTable, favs.toJson());
    return favs;
  }

  Future<Favorites> readFavorites(int id) async {
    final db = await instance.database;
    final map = await db.query(
      favoritesTable,
      columns: ['${FavoritesFields.idsStringList}'],
      where: '${FavoritesFields.id} = ?',
      whereArgs: [id],
    );
    if (map.isNotEmpty)
      return Favorites.fromJSON(map.first);
    else
      throw Exception('favs ID $id not found!');
  }

  Future<int> updateDB(Favorites favs) async {
    final db = await instance.database;
    return db.update(
      favoritesTable,
      favs.toJson(),
      where: '${FavoritesFields.id} = ?',
      whereArgs: [Favorites.getID()],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
