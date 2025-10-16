// features/home_screen/cubit/home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helpers/app_logger.dart';
import 'home_state.dart';
import '../data/repository/home_repository.dart';
import 'package:flutter_task/core/helpers/enum.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  HomeCubit(this.repo) : super(const HomeState());

  Future<void> init() async {
    emit(state.copyWith(homeStatus: RequestsStatus.loading));
    try {
      final cats = await repo.getRootCategories();
      final subCategories = await repo.getSubCategories(cats.first.id);
      final (prods, total) = await repo.getProducts(state.filters);
      emit(
        state.copyWith(
          homeStatus: RequestsStatus.success,
          categories: cats,
          selectedCategory: cats.first,
          subCategories: subCategories,
          products: prods,
          total: total,
          hasMore: prods.length < total,
        ),
      );
    } catch (e) {
      AppLogger.error('init error');
      AppLogger.error(e);
      emit(state.copyWith(homeStatus: RequestsStatus.error));
    }
  }

  Future<void> selectCategory(int? catId) async {
    // final f = state.filters.copyWith(categoryId: catId, offset: 0);
    // await _reloadWith(f);

    final cat = state.categories.firstWhere((e) => e.id == catId);
    final subCategories = await repo.getSubCategories(cat.id);
    emit(state.copyWith(selectedCategory: cat, subCategories: subCategories));
  }

  Future<void> applyFilters({
    double? minPrice,
    double? maxPrice,
    String? condition, // 'new'|'used'
    String? paymentMethod, // 'cash'|'installments'|'any'
    bool? onlyOffers,
  }) async {
    final f = state.filters.copyWith(
      minPrice: minPrice,
      maxPrice: maxPrice,
      condition: condition,
      paymentMethod: paymentMethod,
      onlyOffers: onlyOffers,
      offset: 0,
    );
    await _reloadWith(f);
  }

  Future<void> loadMore() async {
    if (!state.hasMore) return;
    final f = state.filters.copyWith(
      offset: state.filters.offset + state.filters.limit,
    );
    try {
      final (prods, total) = await repo.getProducts(f);
      emit(
        state.copyWith(
          products: [...state.products, ...prods],
          filters: f,
          total: total,
          hasMore: state.products.length + prods.length < total,
        ),
      );
    } catch (_) {}
  }

  Future<void> _reloadWith(newFilters) async {
    emit(
      state.copyWith(
        homeStatus: RequestsStatus.loading,
        filters: newFilters,
        products: const [],
      ),
    );
    try {
      final (prods, total) = await repo.getProducts(newFilters);
      emit(
        state.copyWith(
          homeStatus: RequestsStatus.success,
          products: prods,
          total: total,
          hasMore: prods.length < total,
        ),
      );
    } catch (_) {
      emit(state.copyWith(homeStatus: RequestsStatus.error));
    }
  }
}
