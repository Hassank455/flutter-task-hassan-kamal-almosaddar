import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/filter_screen/cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void changeType(String type) {
    emit(state.copyWith(selectedType: type));
  }

  void selectRoom(int value) {
    emit(state.copyWith(selectedRoom: value));
  }

  void changePaymentMethod(String value) {
    emit(state.copyWith(selectedPaymentMethod: value));
  }

  void changePropertyCondition(String value) {
    emit(state.copyWith(selectedPropertyCondition: value));
  }
}
