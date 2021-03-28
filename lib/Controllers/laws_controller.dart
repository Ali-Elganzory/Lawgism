import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lawgism/Models/law_article.dart';
import 'package:lawgism/Models/law_category.dart';

class LawsController with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Map<LawCategory, List<LawArticle>> _laws = {};
  List<LawCategory> get lawCategories => _laws.keys.toList();
  List<LawArticle> lawArticles(LawCategory c) => _laws[c] ?? [];

  bool _isLoadingLaws = false;
  bool get isLoadingLaws => _isLoadingLaws;
  set isLoadingLaws(bool v) {
    _isLoadingLaws = v;
    notifyListeners();
  }

  Future<void> init() async {
    await fetchLaws();
  }

  Future<void> fetchLaws() async {
    isLoadingLaws = true;

    List<QueryDocumentSnapshot> cats =
        (await _firestore.collection("Laws").get()).docs;

    for (var c in cats) {
      _laws[LawCategory.fromJson(c.data() ?? {})] = (await _firestore
              .collection("Laws")
              .doc(c.id)
              .collection("Laws")
              .get())
          .docs
          .map((a) => LawArticle.fromJson(a.data() ?? {}))
          .toList();
    }

    isLoadingLaws = false;
  }
}
