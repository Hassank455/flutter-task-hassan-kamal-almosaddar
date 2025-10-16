import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppDatabase {
  static final AppDatabase _i = AppDatabase._();
  AppDatabase._();
  factory AppDatabase() => _i;

  static const _dbName = 'app.db';
  static const _dbVersion = 2; // زوّد الرقم مع كل migration جديد

  Database? _db;
  Database get db => _db!;

  Future<void> init() async {
    if (_db != null) return;
    final path = join(await getDatabasesPath(), _dbName);
    _db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, v) async {
        final initSql = await rootBundle.loadString('assets/sql/001_init.sql');
        await _executeBatch(db, initSql);
        // بإمكانك هنا تعمل seeding أولي
      },
      onUpgrade: (db, oldV, newV) async {
        if (oldV < 2) {
          final sql = await rootBundle.loadString(
            'assets/sql/002_add_indexes.sql',
          );
          await _executeBatch(db, sql);
        }
      },
    );
  }

  Future<void> _executeBatch(Database db, String allSql) async {
    final batch = db.batch();
    final statements = allSql
        .split(';')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty);
    for (final s in statements) {
      batch.execute(s);
    }
    await batch.commit(noResult: true);
  }
}
