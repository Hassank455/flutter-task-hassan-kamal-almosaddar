import 'package:flutter_task/core/db/app_database.dart';
import 'package:flutter_task/features/home_screen/data/models/category_model.dart';

class CategoryDao {
  final db = AppDatabase().db;

  Future<List<CategoryModel>> getRootCategories() async {
    final rows = await db.query('categories', where: 'parent_id IS NULL', orderBy: 'name ASC');
    return rows.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<List<CategoryModel>> getSubCategories(int parentId) async {
    final rows = await db.query('categories', where: 'parent_id = ?', whereArgs: [parentId], orderBy: 'name ASC');
    return rows.map((e) => CategoryModel.fromMap(e)).toList();
  }
}
