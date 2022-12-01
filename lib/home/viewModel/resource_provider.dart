import 'package:flutter/widgets.dart';
import 'package:flutter_demo_uygulama/home/model/category_model.dart';
import 'package:flutter_demo_uygulama/home/service/resource_service.dart';
import 'package:flutter_demo_uygulama/utility/dio_mixin.dart';
import 'package:flutter_demo_uygulama/utility/mixin_cache.dart';
import '../../login/model/user_request_model.dart';
import '../../login/model/user_response_model.dart';
import '../../login/service/login_service.dart';
import '../../utility/helper.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';

class ResourceProvider extends ChangeNotifier
    with CacheManager, ProjectDioMixin {
  ResourceProvider(String? newToken) {
    token = newToken;
    notifyListeners();
  }

  late final IResourceService resourceService = ResourceService(projectDio);
  late final ILoginService loginService = LoginService(projectDio);
  List<ProductModel> addedProducts = [];
  double tutar = 0.0;
  UserModel? currentUser;
  List<CategoryModel> categories = [];
  String? token;

  Future<List<CategoryModel>?> fetch() async {
    if (token == null) return null;

    currentUser = await resourceService.fetchUser(token!);
    categories = await resourceService.fetchCategories(token!);
    return categories;
  }

  Future<void> login(
      BuildContext context, String username, String password) async {
    UserResponseModel? response = await loginService
        .login(UserRequestModel(username: username, password: password));
    if (response == null) return;
    if (response.responseVal == -1) {
      // ignore: use_build_context_synchronously
      Helper.showErrorToUser(context, response.responseText);
    } else {
      token = response.token;
      notifyListeners();
      saveToken(response.token);
    }
  }

  void urunEkle(ProductModel product) {
    product.numberOfAdded++;
    tutar = tutar + product.price;
    if (product.numberOfAdded == 1) {
      addedProducts.add(product);
    }
    notifyListeners();
  }

  void urunCikar(ProductModel product) {
    product.numberOfAdded--;
    tutar = (tutar - product.price).abs();
    if (product.numberOfAdded == 0) {
      addedProducts.remove(product);
    }
    notifyListeners();
  }
}
