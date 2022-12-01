import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_demo_uygulama/home/model/category_model.dart';
import 'package:flutter_demo_uygulama/home/model/product_model.dart';
import 'package:flutter_demo_uygulama/home/model/user_model.dart';

abstract class IResourceService {
  final Dio dio;
  IResourceService(this.dio);

  Future<UserModel?> fetchUser(String token);
  Future<List<CategoryModel>> fetchCategories(String token);
  Future<List<ProductModel>> fetchProducts(String token, int categoryId);
}

class ResourceService extends IResourceService {
  ResourceService(super.dio);

  @override
  Future<UserModel?> fetchUser(String token) async {
    try {
      final response = await dio.post("get-user", data: {"token": token});
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }

  @override
  Future<List<CategoryModel>> fetchCategories(String token) async {
    try {
      final response = await dio.post("get-category", data: {"token": token});
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data["data"];

        if (jsonBody is List) {
          return jsonBody.map((e) => CategoryModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      log(e.message);
    }

    return [];
  }

  @override
  Future<List<ProductModel>> fetchProducts(String token, int categoryId) async {
    try {
      final response = await dio.post("get-product",
          data: {"token": token, "category_id": categoryId});
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data["data"];

        if (jsonBody is List) {
          return jsonBody.map((e) => ProductModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      log(e.message);
    }

    return [];
  }
}
