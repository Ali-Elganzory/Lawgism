import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/auth_controller.dart';
import 'package:lawgism/Utils/validators/email_validator.dart';
import 'package:lawgism/Utils/validators/password_validator.dart';

class AuthPage extends StatefulWidget {
  static const routeName = "/Auth";

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const double maxFormHeight = 180;
  double formHeight = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size sz = MediaQuery.of(context).size;
    final double sh = sz.height;
    final double sw = sz.width;

    final AuthController _authController =
        Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sh,
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
                Row(
                  children: [
                    Container(
                      height: 0.1 * sh,
                      child: FlutterSwitch(
                        value: LocaleController.isArabic,
                        onToggle: (bool v) {
                          Provider.of<LocaleController>(context, listen: false)
                              .switchLocale();
                        },
                        activeText: "ar",
                        inactiveText: "en",
                        showOnOff: true,
                        activeColor: Theme.of(context).accentColor,
                        inactiveColor: Theme.of(context).accentColor,
                        padding: 4,
                        valueFontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Know your Rights and Responsibilities".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 0.1 * sh,
                ),
                AnimatedContainer(
                  height: formHeight,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 700),
                    opacity: formHeight / maxFormHeight,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _authController.emailController,
                            validator: validateEmail,
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
                            controller: _authController.passwordController,
                            validator: validatePassword,
                            obscureText: true,
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
                Selector<AuthController, bool>(
                  selector: (_, con) => con.isSigningIn,
                  builder: (_, isSigningIn, __) => Column(
                    children: [
                      Container(
                        height: 46,
                        child: TextButton(
                          onPressed: isSigningIn
                              ? null
                              : () {
                                  if (formHeight >= maxFormHeight) {
                                    if (_formKey.currentState != null) {
                                      if (_formKey.currentState!.validate()) {
                                        _authController
                                            .signInWithEmailAndPassword();
                                      } else {
                                        setState(() {
                                          // formHeight = 1.5 * maxFormHeight;
                                        });
                                      }
                                    }
                                  }
                                  setState(() {
                                    formHeight = maxFormHeight;
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: isSigningIn
                                ? Colors.grey
                                : Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 46,
                        child: TextButton(
                          onPressed: isSigningIn
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                isSigningIn ? Colors.grey : Color(0xFFDB4437),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
