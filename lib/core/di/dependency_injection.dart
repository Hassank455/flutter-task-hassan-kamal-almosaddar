import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:get_it/get_it.dart';

//! important
// registerLazySingleton => create one instant and use it in all app
// registerFactory => every time we want to use it create new instant

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  // Dio dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(
  //   () => ApiService(dio, baseUrl: dotenv.env['API_BASE_URL']!),
  // );

  // home
  getIt.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());

  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  // Profile
  // getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  // getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
}

// to reset di
Future<void> resetAndSetupDependencies() async {
  await getIt.reset();
  await setupGetIt();
}
