class ItemModel {
  String name;
  String description;
  double price;
  String image;
  bool isLiked;

  ItemModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isLiked = false,
  });
}
