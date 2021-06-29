import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/favorites_model.dart';

class FavoritesDatabase {
  static final instance = FavoritesDatabase._init();
  static Database? _database;
  FavoritesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<String> getDBPath() async {
    Directory? appDocDir = await getExternalStorageDirectory();
    return appDocDir!.path;
  }

  Future<Database> _initDB(String dbName) async {
    String dbPath = await getDBPath();
    final path = dbPath + "/" + dbName;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final favsIdType = 'INT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $favoritesTable (
      ${FavoritesFields.id} $idType,
      ${FavoritesFields.favsId} $favsIdType,
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
      where: '${FavoritesFields.favsId} = ?',
      whereArgs: [id],
    );
    if (map.isNotEmpty)
      return Favorites.fromJSON(map.first);
    else
      return Favorites([]);
  }

  Future<int> updateDB(Favorites favs) async {
    final db = await instance.database;
    return db.update(
      favoritesTable,
      favs.toJson(),
      where: '${FavoritesFields.favsId} = ?',
      whereArgs: [Favorites.getID()],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
