class FilterState {
  final List<String> types;
  final String selectedType;
  final List<int> rooms;
  final int? selectedRoom;
  final List<String> paymentMethods;
  final String selectedPaymentMethod;

  final List<String> propertyConditions;
  final String selectedPropertyCondition;

  const FilterState({
    this.types = const ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
    String? selectedType,
    this.rooms = const [4, 5, 6, 8],
    this.selectedRoom,
    this.paymentMethods = const ['أى', 'تقسيط', 'كاش'],
    this.selectedPaymentMethod = 'أى',
    this.propertyConditions = const ['أى', 'جاهز', 'قيد الإنشاء'],
    this.selectedPropertyCondition = 'أى',
  }) : selectedType = selectedType ?? 'الكل';

  FilterState copyWith({
    List<String>? types,
    String? selectedType,
    List<int>? rooms,
    int? selectedRoom,
    List<String>? paymentMethods,
    String? selectedPaymentMethod,
    List<String>? propertyConditions,
    String? selectedPropertyCondition,
  }) {
    return FilterState(
      types: types ?? this.types,
      selectedType: selectedType ?? this.selectedType,
      rooms: rooms ?? this.rooms,
      selectedRoom: selectedRoom ?? this.selectedRoom,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      propertyConditions: propertyConditions ?? this.propertyConditions,
      selectedPropertyCondition:
          selectedPropertyCondition ?? this.selectedPropertyCondition,
    );
  }
}
