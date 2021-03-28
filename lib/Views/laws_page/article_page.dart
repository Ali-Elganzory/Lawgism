import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:lawgism/Models/law_article.dart';
import 'package:lawgism/Models/law_article_item.dart';

class ArticlePage extends StatelessWidget {
  static const String routeName = '/Article';

  const ArticlePage({required this.article});

  final LawArticle article;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sw = size.width;
    final double sh = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CachedNetworkImage(
                  imageUrl: article.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.03 * sw,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.line_style,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          article.title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                      child: Text(
                        article.brief,
                      ),
                    ),
                    for (LawArticleItem contentItem in article.content)
                      ArticleItemWidget(item: contentItem)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({required this.item});

  final LawArticleItem item;

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case LawArticleItemType.image:
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
          child: CachedNetworkImage(
            imageUrl: item.content,
            fit: BoxFit.cover,
          ),
        );

      case LawArticleItemType.headline1:
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
          child: Text(
            item.content,
            style: Theme.of(context).textTheme.headline4,
          ),
        );

      case LawArticleItemType.headline2:
        return Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 12,
                color: Colors.grey.shade800,
              ),
              const SizedBox(width: 10),
              Text(
                item.content,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        );

      case LawArticleItemType.body:
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
          child: Text(
            item.content,
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
          child: Text(
            item.content,
          ),
        );
    }
  }
}
