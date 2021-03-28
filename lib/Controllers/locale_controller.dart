import 'package:flutter/material.dart';

extension StringTranslate on String {
  String get tr =>
      (LocaleController
          ._textValues[LocaleController._currentLocale.languageCode]!)[this] ??
      this;
}

class LocaleController with ChangeNotifier {
  static const Locale en = Locale("en", "UK");
  static const Locale ar = Locale("ar", "AE");
  static Locale _currentLocale = ar;

  static const List<Locale> supportedLocales = [en, ar];

  Locale get currentLocale => _currentLocale;
  set currentLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  // BottomNavigationBarLabels
  static List<String> get bottomNavigationBarLabels =>
      [lawsLabel, discussionLabel, messagesLabel, profileLabel];
  static String get lawsLabel =>
      (_textValues[_currentLocale.languageCode]!)['Laws'] ?? '';
  static String get discussionLabel =>
      (_textValues[_currentLocale.languageCode]!)['Discussion'] ?? '';
  static String get messagesLabel =>
      (_textValues[_currentLocale.languageCode]!)['Messages'] ?? '';
  static String get profileLabel =>
      (_textValues[_currentLocale.languageCode]!)['Profile'] ?? '';

  static const Map<String, Map<String, String>> _textValues = {
    'en': {
      // Auth
      'Email': 'Email',
      'Password': 'Password',
      'Sign in with Email': 'Sign in with Email',
      'Sign in with Google': 'Sign in with Google',
      'Sign Out': 'Sign Out',
      'Account': 'Account',
      'Name': 'Name',
      'Phone': 'Phone',
      'Address': 'Address',
      'Save': 'Save',
      'Edit': 'Edit',
      'Change Photo': 'Change Photo',
      'Change Profile Photo': 'Change Profile Photo',
      'Take Photo': 'Take Photo',
      'Choose Photo': 'Choose Photo',
      // BottomNavigationBarLabels
      'Laws': 'Laws',
      'Discussion': 'Discussion',
      'Messages': 'Messages',
      'Profile': 'Profile',
      'Msaaaaa': 'Msaaaaa',
    },
    'ar': {
      // Auth
      'Email': 'البريد الالكتروني',
      'Password': 'كلمة السر',
      'Sign in with Email': 'ادخل بالبريد الالكتروني',
      'Sign in with Google': 'ادخل ببريد جوجل',
      'Sign Out': 'تسجيل خروج',
      'Account': 'البيانات',
      'Name': 'الاسم',
      'Phone': 'الهاتف',
      'Address': 'العنوان',
      'Save': 'حفظ',
      'Edit': 'تعديل',
      'Change Photo': 'غير الصورة',
      'Change Profile Photo': 'غيّر الصورة الشخصية',
      'Take Photo': 'صوّر بالكاميرا',
      'Choose Photo': 'اختر صورة',
      // BottomNavigationBarLabels
      'Laws': 'قوانين',
      'Discussion': 'نقاش',
      'Messages': 'رسائل',
      'Profile': 'ملف شخصي',
      'Msaaaaa': 'مساااا',
    }
  };
}
