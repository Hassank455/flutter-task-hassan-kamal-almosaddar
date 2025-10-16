class FilterParams {
  final int? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final String? condition;      // 'new'|'used'
  final String? paymentMethod;  // 'cash'|'installments'|'any'
  final bool onlyOffers;
  final int limit;
  final int offset;

  const FilterParams({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.condition,
    this.paymentMethod,
    this.onlyOffers = false,
    this.limit = 20,
    this.offset = 0,
  });

  FilterParams copyWith({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? condition,
    String? paymentMethod,
    bool? onlyOffers,
    int? limit,
    int? offset,
  }) {
    return FilterParams(
      categoryId: categoryId ?? this.categoryId,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      condition: condition ?? this.condition,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      onlyOffers: onlyOffers ?? this.onlyOffers,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}
