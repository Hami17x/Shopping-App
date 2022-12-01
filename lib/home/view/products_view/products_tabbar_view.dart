import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModel/resource_provider.dart';
import '../../model/category_model.dart';
import 'products_page.dart';

class ProductsTabBarView extends StatelessWidget {
  final List<CategoryModel> categories;
  const ProductsTabBarView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: categories
            .map((e) => ProductsPage(
                  categoryId: e.id,
                  token: context.read<ResourceProvider>().token!,
                ))
            .toList(),
      ),
    );
  }
}
