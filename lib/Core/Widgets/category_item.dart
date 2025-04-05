import 'package:flutter/material.dart';
import 'package:news/Models/articles_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.items});
  final ArticlesModel items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 120,
              width: 120,
              child:
                  items.image == null
                      ? Image.network(
                        "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDBFLz33tvpk/v1/1200x800.jpg",
                      )
                      : Image.network(items.image!),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "${items.publishedAt.year}-${items.publishedAt.month}-${items.publishedAt.day}",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
