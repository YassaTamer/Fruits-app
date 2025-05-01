class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.image, required this.name});
}

class ProductModel {
  final String name;
  final String image;
  final double price;
  final double rate;
  final int rateCount;

  ProductModel({
    required this.price,
    required this.rate,
    required this.rateCount,
    required this.image,
    required this.name,
  });
}
