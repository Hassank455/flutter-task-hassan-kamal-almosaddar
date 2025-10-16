import 'package:flutter_task/core/helpers/enum.dart';

class HomeState {
  final RequestsStatus homeStatus;

  const HomeState({this.homeStatus = RequestsStatus.initial});

  HomeState copyWith({RequestsStatus? homeStatus}) {
    return HomeState(homeStatus: homeStatus ?? this.homeStatus);
  }
}
