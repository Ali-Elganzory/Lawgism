import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:lawgism/Controllers/navigation_controller.dart';
import 'package:lawgism/Models/law_category.dart';
import 'package:lawgism/Views/laws_page/articles_page.dart';

class LawCategoryTile extends StatelessWidget {
  const LawCategoryTile({
    required this.lawCategory,
  });

  final LawCategory lawCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            lawCategory.coverUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          NavigationController.navigateTo(ArticlesPage.routeName, lawCategory);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              lawCategory.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
