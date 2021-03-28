import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lawgism/Controllers/navigation_controller.dart';
import 'package:lawgism/Models/answer.dart';
import 'package:lawgism/Models/question.dart';

class DiscussionController with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Question> _questions = [];
  List<Question> get questions => [..._questions];

  bool _isLoadingQs = false;
  bool _isSubmittingQ = false;
  bool get isLoadingQs => _isLoadingQs;
  set isLoadingQs(bool v) {
    _isLoadingQs = v;
    notifyListeners();
  }

  bool get isSubmittingQ => _isSubmittingQ;
  set isSubmittingQ(bool v) {
    _isSubmittingQ = v;
    notifyListeners();
  }

  final TextEditingController questionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  Future<void> init() async {
    await fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    isLoadingQs = true;

    _questions = (await _firestore.collection("Questions").get())
        .docs
        .map((e) => Question.fromJson(e.data() ?? {}).copyWith(id: e.id))
        .toList();

    isLoadingQs = false;
  }

  Future<void> addQuestion(String id) async {
    isSubmittingQ = true;

    Question q = Question(
      questionerId: id,
      createdAt: DateTime.now(),
      question: questionController.text,
      url: linkController.text,
      description: descriptionController.text,
      answerCount: 0,
    );
    q = await _addQuestion(q);

    NavigationController.goBack();

    _questions.add(q);
    notifyListeners();

    questionController.text = "";
    linkController.text = "";
    descriptionController.text = "";

    isSubmittingQ = false;
  }

  Future<Question> _addQuestion(Question q) async {
    return q.copyWith(
        id: (await _firestore.collection("Questions").add(q.toJson())).id);
  }

  Future<void> addAnswer({
    required Question q,
    required String id,
  }) async {
    isSubmittingQ = true;

    Answer a = Answer(
      answererId: id,
      answer: answerController.text,
      createdAt: DateTime.now(),
      votes: 0,
    );
    await _addAnswer(q: q, a: a);
    final int idx = _questions.indexWhere((e) => e.id == q.id);
    if (idx != -1)
      _questions[idx] = _questions[idx]
          .copyWith(answerCount: (_questions[idx].answerCount + 1));

    NavigationController.goBack();

    answerController.text = "";

    isSubmittingQ = false;
  }

  Future<void> _addAnswer({
    required Question q,
    required Answer a,
  }) async {
    await _firestore
        .collection("Questions")
        .doc(q.id)
        .collection("Answers")
        .add(a.toJson());

    await _firestore
        .collection("Questions")
        .doc(q.id)
        .set({"answerCount": FieldValue.increment(1)}, SetOptions(merge: true));
  }

  Stream<List<Answer>> getAnswers(
    Question q,
  ) {
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
        .set({"votes": FieldValue.increment(1)}, SetOptions(merge: true));
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
