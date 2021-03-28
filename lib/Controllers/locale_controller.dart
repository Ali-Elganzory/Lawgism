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
  // For language switch between Arabic & English
  static bool get isArabic => _currentLocale == ar;
  void switchLocale() {
    currentLocale = currentLocale == ar ? en : ar;
  }

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
      'Know your Rights and Responsibilities':
          'Know your Rights and Responsibilities',
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
      // Discussion Page
      'New Question': 'New Question',
      'Question': 'Question',
      'Write your question': 'Write your question',
      'Supporting Link (Optional)': 'Supporting Link (Optional)',
      'Description (Optional)': 'Description (Optional)',
      'URL Link': 'URL Link',
      'Any additional details for explaining your question within context':
          'Any additional details for explaining your question within context',
      'Submit': 'Submit',
      'Asked on ': 'Asked on ',
      'Answers': 'Answers',
    },
    'ar': {
      'Know your Rights and Responsibilities': 'اعرف وناقش حقوقك وواجباتك',
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
      'Discussion': 'نِقاش',
      'Messages': 'رسائل',
      'Profile': 'ملف شخصي',
      'Msaaaaa': 'مساااا',
      // Discussion Page
      'New Question': 'سؤال جديد',
      'Question': 'السؤال',
      'Write your question': 'اكتب سؤالك',
      'Supporting Link (Optional)': 'رابط اضافي (اختياري)',
      'Description (Optional)': 'وصف اضافي (اختياري)',
      'URL Link': 'رابط انترنت',
      'Any additional details for explaining your question within context':
          'أي تفاصيل تساعد على وصف سؤالك او توفير سياق',
      'Submit': 'ابعت',
      'Asked on ': 'سُؤِلَ في ',
      'Answers': 'أجوبة',
    }
  };
}
