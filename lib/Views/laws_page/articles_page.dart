import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/laws_controller.dart';
import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Models/law_article.dart';
import 'package:lawgism/Models/law_category.dart';
import 'package:lawgism/Views/laws_page/law_article_tile.dart';

class ArticlesPage extends StatelessWidget {
  static const routeName = "/Articles";

  const ArticlesPage({required this.lawCategory});

  final LawCategory lawCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lawCategory.name.tr),
      ),
      body: Selector<LawsController, List<LawArticle>>(
        selector: (_, con) => con.lawArticles(lawCategory),
        builder: (_, articles, __) => articles.isEmpty
            ? Center(
                child: Text("Sorry, no articles yet."),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: articles.length,
                itemBuilder: (_, idx) {
                  return LawArticleTile(article: articles[idx]);
                },
              ),
      ),
    );
  }
}
