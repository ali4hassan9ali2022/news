import 'package:flutter/material.dart';

import 'package:news/Core/Widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryItem();
      },
    );
  }
}
