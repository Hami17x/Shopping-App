import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final projectDio =
      Dio(BaseOptions(baseUrl: "https://www.geowix.com/flutterDemo/"));
}
