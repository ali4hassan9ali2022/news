import 'package:flutter/material.dart';

import 'package:news/Core/Widgets/category_item.dart';
import 'package:news/Core/Widgets/custom_divider.dart';
import 'package:news/Models/articles_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.itmes});
  final List<ArticlesModel> itmes;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
      itemCount: itmes.length,
      itemBuilder: (context, index) {
        return  CategoryItem(
items: itmes[index],
        );
      },
    );
  }
}

