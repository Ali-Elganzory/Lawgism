import 'package:flutter/material.dart';
import 'package:lawgism/Controllers/locale_controller.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/navigation_controller.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      resizeToAvoidBottomInset: true,
      body: Consumer<NavigationController>(builder: (ctx, navProvider, ch) {
        return SafeArea(
          child: PageView(
            // physics: NeverScrollableScrollPhysics(),
            controller: navProvider.pageController,
            children: navProvider.pageViewPages,
            onPageChanged: navProvider.selectPage,
          ),
        );
      }),
    );
  }
}

class NavigationBar extends StatelessWidget {
  // static const _bodyBorderRadius = Constants.bodyBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (ctx, navProvider, ch) {
        return BottomNavigationBar(
          items: [0, 1, 2, 3]
              .map(
                (index) => BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: NavigationController.navBarIcons[index],
                  ),
                  label: LocaleController.bottomNavigationBarLabels[index],
                ),
              )
              .toList(),
          key: NavigationController.bottomNavBarKey,
          currentIndex: navProvider.selectedPageIndex,
          elevation: 24.0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          // unselectedLabelStyle: TextStyle(fontFamily: Constants.fontFamily),
          onTap: (n) {
            navProvider.animateToPage(n);
          },
        );
      },
    );
  }
}
