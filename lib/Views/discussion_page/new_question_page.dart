import 'package:flutter/material.dart';
import 'package:lawgism/Controllers/auth_controller.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';

class NewQuestionPage extends StatefulWidget {
  static const routeName = "/NewQuestion";

  static const double textFieldHeight = 42;
  static const double sidePadding = 12;

  @override
  _NewQuestionPageState createState() => _NewQuestionPageState();
}

class _NewQuestionPageState extends State<NewQuestionPage> {
  @override
  Widget build(BuildContext context) {
    final DiscussionController _discussionController =
        Provider.of<DiscussionController>(context, listen: false);

    final bool isDisabled =
        _discussionController.questionController.text.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text("New Question".tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: NewQuestionPage.sidePadding,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Question".tr,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  height: NewQuestionPage.textFieldHeight,
                  child: TextFormField(
                    controller: _discussionController.questionController,
                    decoration:
                        InputDecoration(hintText: "Write your question".tr),
                    onChanged: (v) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Supporting Link (Optional)".tr,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  height: NewQuestionPage.textFieldHeight,
                  child: TextFormField(
                    controller: _discussionController.linkController,
                    decoration: InputDecoration(hintText: "URL Link".tr),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Description (Optional)".tr,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  child: TextFormField(
                    controller: _discussionController.descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText:
                            "Any additional details for explaining your question within context"
                                .tr),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(),
          ),
          Selector<DiscussionController, bool>(
            selector: (_, con) => con.isSubmittingQ,
            builder: (_, isSubmittingQ, __) => Stack(
              children: [
                TextButton(
                  onPressed: isDisabled || isSubmittingQ
                      ? null
                      : () {
                          _discussionController.addQuestion(
                              Provider.of<AuthController>(context,
                                      listen: false)
                                  .uid);
                        },
                  child: Text(
                    "Submit".tr,
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
