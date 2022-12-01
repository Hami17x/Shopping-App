class ProductModel {
  final int id;
  final String name;
  final String currency;
  final String photo;
  final int categoryId;
  final String categoryName;
  final double price;
  int numberOfAdded = 0;

  ProductModel(
      {required this.id,
      required this.price,
      required this.name,
      required this.currency,
      required this.photo,
      required this.categoryId,
      required this.categoryName});

  factory ProductModel.fromJson(json) => ProductModel(
      price: json["product_price"].toDouble(),
      id: json["product_id"],
      name: json["product_name"],
      currency: json["product_currency"],
      photo: json["product_photo"],
      categoryId: json["category_id"],
      categoryName: json["category_name"]);
}
