import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lawgism/Models/answer.dart';
import 'package:lawgism/Models/question.dart';

class DiscussionController with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Question> _questions = [];
  List<Question> get questions => _questions;

  bool _isLoadingQs = false;
  bool get isLoadingQs => _isLoadingQs;
  set isLoadingQs(bool v) {
    _isLoadingQs = v;
    notifyListeners();
  }

  Future<void> fetchQuestions() async {
    isLoadingQs = true;

    _questions = (await _firestore.collection("Questions").get())
        .docs
        .map((e) => Question.fromJson(e.data() ?? {}).copyWith(id: e.id))
        .toList();

    isLoadingQs = false;
  }

  Future<void> addQuestion(Question q) async {
    await _firestore.collection("Questions").add(q.toJson());
  }

  Future<void> addAnswer({
    required Question q,
    required Answer a,
  }) async {
    await _firestore
        .collection("Questions")
        .doc(q.id)
        .collection("Answers")
        .add(a.toJson());
  }

  Future<Stream<List<Answer>>> getAnswers(
    Question q,
  ) async {
    return _firestore
        .collection("Questions")
        .doc(q.id)
        .collection("Answers")
        .snapshots()
        .map((e) => e.docs
            .map((a) => Answer.fromJson(a.data() ?? {}).copyWith(id: a.id))
            .toList());
  }

  Future<void> voteAnswer({
    required Question q,
    required Answer a,
  }) async {
    await _firestore
        .collection("Questions")
        .doc(q.id)
        .collection("Answers")
        .doc(a.id)
        .set({"votes": FieldValue.increment(1)});
  }

  Future<void> unvoteAnswer({
    required Question q,
    required Answer a,
  }) async {
    await _firestore
        .collection("Questions")
        .doc(q.id)
        .collection("Answers")
        .doc(a.id)
        .set({"votes": FieldValue.increment(-1)});
  }
}
