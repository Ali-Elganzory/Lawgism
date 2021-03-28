import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawgism/Controllers/auth_controller.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  static const routeName = "/Auth";

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const double maxFormHeight = 120;
  double formHeight = 120;

  @override
  Widget build(BuildContext context) {
    final Size sz = MediaQuery.of(context).size;
    final double sw = sz.width;

    final AuthController _authController =
        Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/justice_cover.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.12 * sw),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: formHeight,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 700),
                  opacity: formHeight / maxFormHeight,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email'.tr,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password'.tr,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 46,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      formHeight = (maxFormHeight - formHeight);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 180,
                        alignment: Alignment.center,
                        child: Text(
                          "Sign in with Email".tr,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Selector<AuthController, bool>(
                selector: (_, con) => con.isLoading,
                builder: (_, isLoading, __) => Container(
                  height: 46,
                  child: TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            _authController.signInWithGoogle();
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          alignment: Alignment.center,
                          width: 180,
                          child: Text(
                            "Sign in with Google".tr,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFDB4437),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
