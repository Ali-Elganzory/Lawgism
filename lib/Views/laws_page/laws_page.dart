import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/laws_controller.dart';
import 'package:lawgism/Models/law_category.dart';
import 'package:lawgism/Views/laws_page/law_category_tile.dart';

class LawsPage extends StatelessWidget {
  static const routeName = "/Laws";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laws".tr),
      ),
      body: Selector<LawsController, bool>(
        selector: (_, con) => con.isLoadingLaws,
        builder: (_, isLoadingLaws, __) => isLoadingLaws
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Selector<LawsController, List<LawCategory>>(
                selector: (_, con) => con.lawCategories,
                builder: (_, lawCategories, __) => GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: lawCategories.length,
                  itemBuilder: (_, idx) {
                    return LawCategoryTile(lawCategory: lawCategories[idx]);
                  },
                ),
              ),
      ),
    );
  }
}
