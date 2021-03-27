import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:lawgism/Controllers/navigation_controller.dart';

import 'package:lawgism/Views/home_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lawgism',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(13, 41, 53, 1),
        accentColor: Color.fromRGBO(199, 165, 116, 1),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<NavigationController>(
            create: (_) => NavigationController(),
          ),
        ],
        child: AppEntry(),
      ),
    );
  }
}

class AppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
