import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/add_ad_screen/add_ad_screen.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_state.dart';
import 'package:flutter_task/features/chat_screen/chat_screen.dart';
import 'package:flutter_task/features/home_screen/home_screen.dart';
import 'package:flutter_task/features/my_ads_screen/my_ads_screen.dart';
import 'package:flutter_task/features/profile_screen/profile_screen.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState());

  List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    AddAdScreen(),
    MyAdsScreen(),
    ProfileScreen(),
  ];

  setIndexScreen(int value) {
    HapticFeedback.vibrate();
    emit(state.copyWith(currentIndex: value));
  }
}
