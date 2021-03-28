import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lawgism/views/laws_page/laws_page.dart';
import 'package:lawgism/Views/discussion_page/discussion_page.dart';
import 'package:lawgism/Views/profile_page/profile_page.dart';

class NavigationController with ChangeNotifier {
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey _bottomNavBarKey = GlobalKey();
  static const int _initialPage = 0;
  static int _selectedPage = _initialPage;

  static List<String> navBarLabels = [
    "Laws",
    "Discussion",
    "Messages",
    "Profile",
  ];

  final List<Widget> _pages = [
    LawsPage(),
    DiscussionPage(),
    // LawsPage(),
    ProfilePage(),
  ];

  final PageController _pageController = PageController(
    initialPage: _initialPage,
  );

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  static GlobalKey get bottomNavBarKey => _bottomNavBarKey;
  PageController get pageController => _pageController;
  List<Widget> get pageViewPages => _pages;
  static List<Icon> get navBarIcons => _navBarIcons;
  int get selectedPageIndex => _selectedPage;

  void selectPage(int n) {
    _selectedPage = n;
    notifyListeners();
  }

  void selectPageStatic(int n) {
    _selectedPage = n;
  }

  void animateToPage(int n) {
    if (_pageController.hasClients && _pageController.page?.round() != n) {
      _selectedPage = n;
      pageController.jumpToPage(
        _selectedPage,
        // duration: Duration(milliseconds: 400),
        // curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  static const List<Icon> _navBarIcons = [
    Icon(FontAwesomeIcons.balanceScale),
    Icon(Icons.chat_outlined),
    // Icon(FontAwesomeIcons.envelope),
    Icon(Icons.person_outline),
  ];

  static Future<dynamic> navigateTo(String routeName, Object object) {
    return _navigatorKey.currentState
            ?.pushNamed(routeName, arguments: object) ??
        Future<bool>.value(false);
  }

  static void goBack() {
    return _navigatorKey.currentState?.pop();
  }
}
