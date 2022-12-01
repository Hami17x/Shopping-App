import 'package:flutter_demo_uygulama/home/model/product_model.dart';

class CategoryModel {
  final int id;
  final String name;
  List<ProductModel> products = [];

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(json) =>
      CategoryModel(id: json["category_id"], name: json["category_name"]);
}
