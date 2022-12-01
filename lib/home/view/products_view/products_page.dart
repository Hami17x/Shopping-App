import 'package:flutter/material.dart';
import 'package:flutter_demo_uygulama/home/model/product_model.dart';
import 'package:flutter_demo_uygulama/home/view/products_view/products_container.dart';
import 'package:flutter_demo_uygulama/home/service/resource_service.dart';
import 'package:flutter_demo_uygulama/utility/dio_mixin.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage(
      {super.key, required this.categoryId, required this.token});
  final int categoryId;
  final String token;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with AutomaticKeepAliveClientMixin, ProjectDioMixin {
  List<ProductModel> liste = [];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    IResourceService resourceService = ResourceService(projectDio);
    liste =
        await resourceService.fetchProducts(widget.token, widget.categoryId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: liste.length,
      itemBuilder: (BuildContext context, int index) {
        ProductModel product = liste[index];
        return ProductContainer(productModel: product);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
