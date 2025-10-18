import 'package:flutter_task/core/db/app_database.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter_task/features/filter_screen/cubit/filter_cubit.dart';
import 'package:flutter_task/features/home_screen/cubit/home_cubit.dart';
import 'package:flutter_task/features/home_screen/data/local/dao/category_dao.dart';
import 'package:flutter_task/features/home_screen/data/local/dao/product_dao.dart';
import 'package:flutter_task/features/home_screen/data/repository/home_repository.dart';
import 'package:flutter_task/features/home_screen/data/repository/home_repository_impl.dart';
import 'package:flutter_task/features/home_screen/data/seed/seed_loader.dart';
import 'package:get_it/get_it.dart';

//! important
// registerLazySingleton => create one instant and use it in all app
// registerFactory => every time we want to use it create new instant

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  await getIt<AppDatabase>().init();

  // Seed (تشغيل مرّة عند الإقلاع)
  getIt.registerLazySingleton<SeedLoader>(() => SeedLoader());
  await getIt<SeedLoader>().runIfEmpty();

  // DAOs
  getIt.registerLazySingleton<CategoryDao>(() => CategoryDao());
  getIt.registerLazySingleton<ProductDao>(() => ProductDao());

  // Repo
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<CategoryDao>(), getIt<ProductDao>()),
  );

  // home
  getIt.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<FilterCubit>(() => FilterCubit());

  // Profile
  // getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  // getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
}

// to reset di
Future<void> resetAndSetupDependencies() async {
  await getIt.reset();
  await setupGetIt();
}
