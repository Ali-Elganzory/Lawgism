import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:lawgism/Controllers/navigation_controller.dart';

import 'package:lawgism/Models/law_article.dart';
import 'package:lawgism/Views/laws_page/article_page.dart';

class LawArticleTile extends StatelessWidget {
  const LawArticleTile({required this.article});

  final LawArticle article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationController.navigateTo(ArticlePage.routeName, article);
      },
      child: SizedBox(
        width: double.maxFinite,
        height: 110,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: article.coverUrl,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Center(
                  child: Icon(Icons.error_outline),
                ),
                placeholder: (_, __) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    article.brief,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
