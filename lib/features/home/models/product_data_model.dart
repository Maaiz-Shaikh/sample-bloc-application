class ProductDataModel {
  final String id;
  final String imageUrl;
  final double price;
  final String description;
  final String name;
  bool isWishlisted = false;
  bool isCarted = false;

  ProductDataModel({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.name,
  });
}
