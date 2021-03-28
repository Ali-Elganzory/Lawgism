import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/navigation_controller.dart';
import 'package:lawgism/Models/answer.dart';
import 'package:lawgism/Models/question.dart';
import 'package:lawgism/Views/discussion_page/new_answer_page.dart';
import 'package:lawgism/Views/discussion_page/answer_tile.dart';

import 'package:lawgism/Utils/extensions/date_time_ext.dart';

class QuestionPage extends StatelessWidget {
  static const routeName = "/Question";

  const QuestionPage({required this.question});

  final Question question;

  static const double sidePadding = 12;

  @override
  Widget build(BuildContext context) {
    final DiscussionController _discussionController =
        Provider.of<DiscussionController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Question".tr),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: Text(
              "${"Asked on ".tr} ${question.createdAt!.creationTime}",
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Text(
                    question.question,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    question.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "${question.answerCount} ${"Answers".tr}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  NavigationController.navigateTo(
                      NewAnswerPage.routeName, question);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.question_answer_outlined,
                      size: 38,
                      color: Theme.of(context).accentColor,
                    ),
                    Text(
                      "Answer".tr,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 20,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<Answer>>(
              stream: _discussionController.getAnswers(question),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else if (snapshot.data == null || snapshot.data!.isEmpty)
                  return Container();

                return snapshot.data!.isEmpty
                    ? Container()
                    : ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, idx) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: sidePadding),
                            child: AnswerTile(
                              answer: snapshot.data![idx],
                              question: question,
                            ),
                          );
                        },
                        separatorBuilder: (_, idx) {
                          return const SizedBox(height: 8);
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
