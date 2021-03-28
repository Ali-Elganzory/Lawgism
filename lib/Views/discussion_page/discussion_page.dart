import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Models/question.dart';

class DiscussionPage extends StatelessWidget {
  static const routeName = "/Discussion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussion".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            : GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: questions.length,
                itemBuilder: (_, idx) {
                  return QuestionTile(question: questions[idx]);
                },
              ),
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Halolo"),
    );
  }
}
