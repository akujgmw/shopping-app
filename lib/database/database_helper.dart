import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId TEXT,
        productId TEXT,
        name TEXT,
        image TEXT,
        price TEXT,
        description TEXT
      )
    ''');
  }

  Future<void> insertCartItem(Map<String, dynamic> item) async {
    final db = await instance.database;
    await db.insert('cart', item);
  }

  Future<List<Map<String, dynamic>>> getCartItems(String userId) async {
    final db = await instance.database;
    return await db.query('cart', where: 'userId = ?', whereArgs: [userId]);
  }

  Future<int> deleteCartItem(int id) async {
    final db = await instance.database;
    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
