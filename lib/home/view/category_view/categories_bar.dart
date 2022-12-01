import 'package:flutter/material.dart';

import '../../model/category_model.dart';

class CategoriesBar extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black87),
          tabs: categories
              .map((e) => Tab(
                    child: Text(e.name),
                  ))
              .toList()),
    );
  }
}
