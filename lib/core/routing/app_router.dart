import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/dependency_injection.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter_task/features/bottom_nav/ui/bottom_van_screen.dart';
import 'package:flutter_task/features/filter_screen/cubit/filter_cubit.dart';
import 'package:flutter_task/features/filter_screen/ui/filter_Screen.dart';
import 'package:flutter_task/features/home_screen/cubit/home_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.bottomNavScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (context) => getIt<ProfileCubit>()
              //     ..getProfileData()
              //     ..getSettings(),
              // ),
              BlocProvider(create: (context) => getIt<BottomNavCubit>()),
              BlocProvider(create: (context) => getIt<HomeCubit>()..init()),
            ],
            child: const BottomNanScreen(),
          ),
        );

      case Routes.filterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FilterCubit>(),
            child: FilterScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
