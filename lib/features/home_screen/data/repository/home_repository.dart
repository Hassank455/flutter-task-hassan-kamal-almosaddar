
import 'package:flutter_task/features/home_screen/data/models/category_model.dart';
import 'package:flutter_task/features/home_screen/data/models/filter_params.dart';
import 'package:flutter_task/features/home_screen/data/models/product_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getRootCategories();
  Future<List<CategoryModel>> getSubCategories(int parentId);
  Future<(List<ProductModel>, int total)> getProducts(FilterParams params);
}
