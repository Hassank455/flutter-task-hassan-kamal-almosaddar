import 'package:flutter_task/features/home_screen/data/local/dao/category_dao.dart';
import 'package:flutter_task/features/home_screen/data/local/dao/product_dao.dart';
import 'package:flutter_task/features/home_screen/data/models/category_model.dart';
import 'package:flutter_task/features/home_screen/data/models/filter_params.dart';
import 'package:flutter_task/features/home_screen/data/models/product_model.dart';
import 'package:flutter_task/features/home_screen/data/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final CategoryDao categoryDao;
  final ProductDao productDao;
  HomeRepositoryImpl(this.categoryDao, this.productDao);

  @override
  Future<List<CategoryModel>> getRootCategories() =>
      categoryDao.getRootCategories();

  @override
  Future<List<CategoryModel>> getSubCategories(int parentId) =>
      categoryDao.getSubCategories(parentId);

  @override
  Future<(List<ProductModel>, int)> getProducts(FilterParams params) async {
    final data = await productDao.getProducts(params);
    final total = await productDao.countProducts(params);
    return (data, total);
  }
}
