import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/navigation_controller.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Models/question.dart';
import 'package:lawgism/Views/discussion_page/new_question_page.dart';
import 'package:lawgism/Views/discussion_page/question_tile.dart';

class DiscussionPage extends StatelessWidget {
  static const routeName = "/Discussion";

  static const double sidePadding = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussion".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationController.navigateTo(NewQuestionPage.routeName, '');
        },
        child: Icon(
          FontAwesomeIcons.question,
          color: Colors.white,
        ),
      ),
      body: Selector<DiscussionController, List<Question>>(
        selector: (_, con) => con.questions,
        builder: (_, questions, __) => questions.isEmpty
            ? Center(
                child: Text("Sorry, no questions yet."),
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: sidePadding, vertical: sidePadding + 4),
                itemCount: questions.length,
                itemBuilder: (_, idx) {
                  return QuestionTile(question: questions[idx]);
                },
                separatorBuilder: (_, idx) {
                  return Divider(
                    height: 24,
                    thickness: 1,
                    indent: sidePadding,
                    endIndent: sidePadding,
                  );
                },
              ),
      ),
    );
  }
}
