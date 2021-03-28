import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Controllers/auth_controller.dart';
import 'package:lawgism/Models/user.dart';
import 'package:lawgism/Models/answer.dart';
import 'package:lawgism/Models/question.dart';
import 'package:lawgism/Components/AvatarImage.dart';
import 'package:lawgism/Utils/extensions/date_time_ext.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    required this.question,
    required this.answer,
  });

  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              FutureBuilder<User>(
                future: Provider.of<AuthController>(context, listen: false)
                    .fetchUserProfile(answer.answererId),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();
                  else if (snapshot.hasData) {
                    final User user = snapshot.data!;
                    return Row(
                      children: [
                        AvatarImage(
                          url: user.photoUrl,
                          radius: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(user.name.isEmpty ? "Unnamed".tr : user.name),
                      ],
                    );
                  }
                  return Row(
                    children: [
                      AvatarImage(
                        url:
                            "https://fthmb.tqn.com/FNklQfVa9I70-RIz39WHFHSY45o=/2290x1527/filters:fill(auto,1)/attorney-with-law-books-57a646b53df78cf4591b8b85.jpg",
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Text("Sanaa Ahmed"),
                    ],
                  );
                },
              ),
              Expanded(child: Container()),
              Text(
                "${answer.createdAt!.creationTime}",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 6),
          Text(
            answer.answer,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  Provider.of<DiscussionController>(context, listen: false)
                      .voteAnswer(q: question, a: answer);
                },
                icon: Transform.translate(
                  offset: Offset(26, 0),
                  child: Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    child: Icon(
                      FontAwesomeIcons.thumbsUp,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                label: Container(),
              ),
              Text(
                "${answer.votes}",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
