// features/home_screen/cubit/home_state.dart
import 'package:flutter_task/core/helpers/enum.dart';
import '../data/models/category_model.dart';
import '../data/models/product_model.dart';
import '../data/models/filter_params.dart';

class HomeState {
  final RequestsStatus homeStatus;
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final List<CategoryModel> subCategories;
  final List<ProductModel> products;
  final FilterParams filters;
  final bool hasMore;
  final int total; // لزر "شاهد +10,000 نتائج"

  const HomeState({
    this.homeStatus = RequestsStatus.initial,
    this.categories = const [],
    this.selectedCategory,
    this.subCategories = const [],
    this.products = const [],
    this.filters = const FilterParams(),
    this.hasMore = true,
    this.total = 0,
  });

  HomeState copyWith({
    RequestsStatus? homeStatus,
    List<CategoryModel>? categories,
    CategoryModel? selectedCategory,
    List<CategoryModel>? subCategories,
    List<ProductModel>? products,
    FilterParams? filters,
    bool? hasMore,
    int? total,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      subCategories: subCategories ?? this.subCategories,
      products: products ?? this.products,
      filters: filters ?? this.filters,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
    );
  }
}
