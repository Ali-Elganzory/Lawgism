import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawgism/Controllers/discussion_controller.dart';
import 'package:lawgism/Controllers/laws_controller.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/navigation_controller.dart';
import 'package:lawgism/Controllers/auth_controller.dart';

import 'package:lawgism/Views/auth_page/auth_page.dart';
import 'package:lawgism/Views/home_page.dart';

import 'router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(13, 41, 53, 1),
  ));

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleController>(
          create: (_) => LocaleController(),
        ),
        ChangeNotifierProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<LawsController>(
          create: (_) => LawsController(),
        ),
        ChangeNotifierProvider<DiscussionController>(
          create: (_) => DiscussionController(),
        ),
      ],
      child: MaterialAppEntry(),
    );
  }
}

class MaterialAppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController _authController =
        Provider.of<AuthController>(context, listen: false);
    _authController.authStateChanges.listen((user) {
      if (user != null) {
        Provider.of<LawsController>(context, listen: false).init();
        Provider.of<AuthController>(context, listen: false).fetchProfile();
        Provider.of<DiscussionController>(context, listen: false).init();
      }
    });

    return Selector<LocaleController, Locale>(
      selector: (_, localeProvider) => localeProvider.currentLocale,
      builder: (_, currentLocale, __) => MaterialApp(
        title: 'Lawgism',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocaleController.supportedLocales,
        locale: currentLocale,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          primaryColor: Color.fromRGBO(13, 41, 53, 1),
          accentColor: Color.fromRGBO(199, 165, 116, 1),
          fontFamily: 'Cairo',
          textTheme: TextTheme(
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        navigatorKey: NavigationController.navigatorKey,
        onGenerateRoute: router.Router.generateRoute,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<auth.User?>(
          stream: _authController.authStateChanges,
          builder: (_, snapshot) {
            print("AuthStream:  ${snapshot}");
            if (snapshot.connectionState == ConnectionState.waiting)
              return AuthPage();
            if (snapshot.hasData && (!snapshot.data!.isAnonymous)) {
              return HomePage();
            } else {
              return AuthPage();
            }
          },
        ),
      ),
    );
  }
}
