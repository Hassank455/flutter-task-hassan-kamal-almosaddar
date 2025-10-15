import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_state.dart';
import 'package:flutter_task/features/bottom_nav/ui/widget/custom_nav_bottom.dart';

class BottomNanScreen extends StatelessWidget {
  const BottomNanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavCubit = context.read<BottomNavCubit>();

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) => Scaffold(
        extendBody: true,
        bottomNavigationBar: SafeArea(
          top: false,
          child: const CustomNavBottom(),
        ),

        body: IndexedStack(
          index: state.currentIndex,
          children: bottomNavCubit.widgetOptions,
        ),
      ),
    );
  }
}
