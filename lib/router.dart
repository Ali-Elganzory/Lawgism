import 'package:flutter/material.dart';
import 'package:lawgism/Models/law_article.dart';
import 'package:lawgism/Models/law_category.dart';
import 'package:lawgism/Models/question.dart';

import 'package:lawgism/Views/auth_page/auth_page.dart';
import 'package:lawgism/Views/discussion_page/discussion_page.dart';
import 'package:lawgism/Views/discussion_page/new_answer_page.dart';
import 'package:lawgism/Views/discussion_page/new_question_page.dart';
import 'package:lawgism/Views/discussion_page/question_page.dart';
import 'package:lawgism/Views/home_page.dart';
import 'package:lawgism/Views/laws_page/article_page.dart';
import 'package:lawgism/Views/laws_page/articles_page.dart';
import 'package:lawgism/Views/laws_page/laws_page.dart';
import 'package:lawgism/Views/profile_page/profile_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return SlideRoute(page: HomePage(), direction: SlideDirection.right);

      case LawsPage.routeName:
        return SlideRoute(page: LawsPage(), direction: SlideDirection.up);

      case ArticlesPage.routeName:
        return SlideRoute(
            page: ArticlesPage(lawCategory: settings.arguments as LawCategory),
            direction: SlideDirection.right);

      case ArticlePage.routeName:
        return SlideRoute(
            page: ArticlePage(article: settings.arguments as LawArticle),
            direction: SlideDirection.up);

      case DiscussionPage.routeName:
        return SlideRoute(
            page: DiscussionPage(), direction: SlideDirection.right);

      case NewQuestionPage.routeName:
        return SlideRoute(
            page: NewQuestionPage(), direction: SlideDirection.right);

      case QuestionPage.routeName:
        return SlideRoute(
            page: QuestionPage(question: settings.arguments as Question),
            direction: SlideDirection.right);

      case NewAnswerPage.routeName:
        return SlideRoute(
            page: NewAnswerPage(question: settings.arguments as Question),
            direction: SlideDirection.right);

      case ProfilePage.routeName:
        return SlideRoute(page: ProfilePage(), direction: SlideDirection.right);

      default:
        return MaterialPageRoute(builder: (_) => AuthPage());
    }
  }
}

enum SlideDirection { left, right, up, down }

class SlideRoute extends PageRouteBuilder {
  final SlideDirection direction;
  final Widget page;

  SlideRoute({
    required this.page,
    this.direction = SlideDirection.left,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: direction == SlideDirection.left
                  ? Offset(1, 0)
                  : direction == SlideDirection.right
                      ? Offset(-1, 0)
                      : direction == SlideDirection.up
                          ? Offset(0, 1)
                          : Offset(0, -1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
}
