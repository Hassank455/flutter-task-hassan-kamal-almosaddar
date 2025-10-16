import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import '../../../../core/db/app_database.dart';

class SeedLoader {
  final Database db = AppDatabase().db;

  Future<void> runIfEmpty() async {
    final res = await db.rawQuery('SELECT COUNT(*) as c FROM categories');
    final count = (res.first['c'] as int?) ?? 0;
    if (count > 0) return;

    final batch = db.batch();

    // Categories
    final catsJson = await rootBundle.loadString('assets/seed/categories.json');
    for (final m in (jsonDecode(catsJson) as List)) {
      batch.insert('categories', Map<String, Object?>.from(m), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    // Products
    final prodJson = await rootBundle.loadString('assets/seed/products.json');
    for (final m in (jsonDecode(prodJson) as List)) {
      batch.insert('products', Map<String, Object?>.from(m), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    // Packages
    final pkJson = await rootBundle.loadString('assets/seed/packages.json');
    for (final m in (jsonDecode(pkJson) as List)) {
      batch.insert('packages', Map<String, Object?>.from(m), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    // Package Items
    final piJson = await rootBundle.loadString('assets/seed/package_items.json');
    for (final m in (jsonDecode(piJson) as List)) {
      batch.insert('package_items', Map<String, Object?>.from(m), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }
}
