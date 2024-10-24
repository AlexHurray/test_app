import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@singleton
class LocalDatabase {
  static const _databaseName = 'test.db';

  static Database? _database;
  static bool _isInitialized = false;

  Database get database {
    if (!_isInitialized) throw Exception('Database is not initialized');
    return _database!;
  }

  Future<void> init() async {
    if (_isInitialized) return;
    await _initDatabase();
    _isInitialized = true;
  }

  //------------------------------------------------------------
  // this opens the database (or creates it if it doesn't exist)
  Future<void> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE PlacesType (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
            )
          ''');
      await db.execute('''
          INSERT INTO PlacesType (id, name) values
            (1, 'Зал 1'),
            (2, 'Зал 2'),
            (3, 'Зал 3')
          ''');
      await db.execute('''
          CREATE TABLE Places (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            typeId INTEGER NOT NULL,
            FOREIGN KEY (typeId) REFERENCES PlacesType(id)
            )
          ''');
      await db.execute('''
          INSERT INTO Places (typeId, id, name) values
            (1, 1, 'Стол №1'),
            (1, 2, 'Стол №2'),
            (2, 3, 'Стол №3'),
            (3, 4, 'VIP-Стол 1'),
            (3, 5, 'VIP-Стол 2')
          ''');
      await db.execute('''
          CREATE TABLE Groups (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
            )
          ''');
      await db.execute('''
          INSERT INTO Groups (id, name) values
            (1, '1 блюда'),
            (2, '2 блюда')
          ''');
      await db.execute('''
          CREATE TABLE Products (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            image TEXT NOT NULL,
            groupId INTEGER NOT NULL,
            price REAL NOT NULL,
            FOREIGN KEY (groupId) REFERENCES Groups(id)
            )
          ''');
      await db.execute('''
          INSERT INTO Products (groupId, id, name, image, price) values
            (1, 1, '1 Блюдо 1', '111.webp', 1),
            (1, 2, '1 Блюдо 2', '222.webp', 2),
            (1, 3, '1 Блюдо 3', '333.webp', 3),
            (1, 4, '1 Блюдо 4', '111.webp', 4),
            (2, 5, '2 Блюдо 1', '222.webp', 5),
            (2, 6, '2 Блюдо 2', '111.webp', 6),
            (2, 7, '2 Блюдо 3', '333.webp', 7),
            (2, 8, '2 Блюдо 4', '111.webp', 8),
            (2, 9, '2 Блюдо 5', '222.webp', 9)
          ''');
      await db.execute('''
          CREATE TABLE Orders (
            id INTEGER PRIMARY KEY,
            isActive INTEGER DEFAULT 1 NOT NULL,
            placeId INTEGER NOT NULL,
            createdAt TEXT NOT NULL,
            FOREIGN KEY (placeId) REFERENCES Places(id)
            )
          ''');
      await db.execute('''
          CREATE TABLE Cart (
            orderId INTEGER NOT NULL,
            productId INTEGER NOT NULL,
            amount INTEGER NOT NULL,
            PRIMARY KEY (orderId, productId),
            FOREIGN KEY (orderId) REFERENCES Orders(id),
            FOREIGN KEY (productId) REFERENCES Products(id)
            )
          ''');
    });
  }
}
