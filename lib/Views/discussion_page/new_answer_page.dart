import 'package:flutter/material.dart';
import 'package:lawgism/Controllers/auth_controller.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Models/question.dart';

class NewAnswerPage extends StatefulWidget {
  static const routeName = "/NewAnswer";

  const NewAnswerPage({required this.question});

  final Question question;

  @override
  _NewAnswerPageState createState() => _NewAnswerPageState();
}

class _NewAnswerPageState extends State<NewAnswerPage> {
  static const double textFieldHeight = 42;
  static const double sidePadding = 12;

  @override
  Widget build(BuildContext context) {
    final DiscussionController _discussionController =
        Provider.of<DiscussionController>(context, listen: false);

    final bool isDisabled = _discussionController.answerController.text.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text("New Answer".tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: sidePadding,
              vertical: 10,
            ),
            child: Text(
              widget.question.question,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              child: TextFormField(
                controller: _discussionController.answerController,
                decoration: InputDecoration(
                  hintText: "Write your answer...".tr,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: sidePadding),
                  border: InputBorder.none,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                onChanged: (v) {
                  setState(() {});
                },
                maxLines: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Selector<DiscussionController, bool>(
            selector: (_, con) => con.isSubmittingQ,
            builder: (_, isSubmittingQ, __) => Stack(
              children: [
                TextButton(
                  onPressed: isDisabled || isSubmittingQ
                      ? null
                      : () {
                          _discussionController.addAnswer(
                            q: widget.question,
                            id: Provider.of<AuthController>(context,
                                    listen: false)
                                .uid,
                          );
                        },
                  child: Text(
                    "Answer".tr,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isDisabled
                        ? Colors.grey
                        : Theme.of(context).accentColor,
                    minimumSize: Size(double.maxFinite, 46),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                if (isSubmittingQ)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
