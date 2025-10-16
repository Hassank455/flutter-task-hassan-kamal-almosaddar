
import 'package:flutter_task/core/db/app_database.dart';
import 'package:flutter_task/features/home_screen/data/models/filter_params.dart';
import 'package:flutter_task/features/home_screen/data/models/product_model.dart';

class ProductDao {
  final db = AppDatabase().db;

  Future<List<ProductModel>> getProducts(FilterParams f) async {
    final where = <String>[];
    final args = <Object?>[];

    if (f.categoryId != null) { where.add('category_id = ?'); args.add(f.categoryId); }
    if (f.minPrice != null) { where.add('price >= ?'); args.add(f.minPrice); }
    if (f.maxPrice != null) { where.add('price <= ?'); args.add(f.maxPrice); }
    if (f.condition != null && f.condition!.isNotEmpty) { where.add('condition = ?'); args.add(f.condition); }
    if (f.paymentMethod != null && f.paymentMethod!.isNotEmpty && f.paymentMethod != 'any') {
      where.add('payment_method = ?'); args.add(f.paymentMethod);
    }
    if (f.onlyOffers) { where.add('is_offer = 1'); }

    final rows = await db.query(
      'products',
      where: where.isEmpty ? null : where.join(' AND '),
      whereArgs: where.isEmpty ? null : args,
      orderBy: 'created_at DESC',
      limit: f.limit,
      offset: f.offset,
    );
    return rows.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<int> countProducts(FilterParams f) async {
    final where = <String>[];
    final args = <Object?>[];

    if (f.categoryId != null) { where.add('category_id = ?'); args.add(f.categoryId); }
    if (f.minPrice != null) { where.add('price >= ?'); args.add(f.minPrice); }
    if (f.maxPrice != null) { where.add('price <= ?'); args.add(f.maxPrice); }
    if (f.condition != null && f.condition!.isNotEmpty) { where.add('condition = ?'); args.add(f.condition); }
    if (f.paymentMethod != null && f.paymentMethod!.isNotEmpty && f.paymentMethod != 'any') {
      where.add('payment_method = ?'); args.add(f.paymentMethod);
    }
    if (f.onlyOffers) { where.add('is_offer = 1'); }

    final res = await db.rawQuery(
      'SELECT COUNT(*) as c FROM products ${where.isEmpty ? '' : 'WHERE ${where.join(' AND ')}'}',
      args,
    );
    return (res.first['c'] as int?) ?? 0;
  }
}
