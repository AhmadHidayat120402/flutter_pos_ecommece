class CategoryModel {
  final int value;
  final String name;

  CategoryModel({
    required this.name,
    required this.value,
  });

  @override
  String toString() => name;
}
