extension StringNullEx on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;
}
