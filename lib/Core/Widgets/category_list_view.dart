import 'package:flutter/material.dart';

import 'package:news/Core/Widgets/category_item.dart';
import 'package:news/Core/Widgets/custom_divider.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryItem();
      },
    );
  }
}

