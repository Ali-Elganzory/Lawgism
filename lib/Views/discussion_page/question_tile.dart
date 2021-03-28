import 'package:flutter/material.dart';

import 'package:lawgism/Models/question.dart';
import 'package:lawgism/Utils/extensions/date_time_ext.dart';
import 'package:lawgism/Controllers/locale_controller.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "${"Asked on ".tr} ${question.createdAt!.creationTime}",
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
          ),
          Text(
            question.question,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            question.description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
    );
  }
}
