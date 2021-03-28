import 'package:intl/intl.dart';

import 'package:lawgism/Controllers/locale_controller.dart';

extension Utils on DateTime {
  bool get isToday {
    final DateTime today = DateTime.now();
    return (this.year == today.year &&
        this.month == today.month &&
        this.day == today.day);
  }

  String get time12 {
    if (LocaleController.isArabic)
      return DateFormat.jm()
          .format(this)
          .replaceFirst("PM", "مساءً")
          .replaceFirst("AM", "صباحًا");
    else
      return DateFormat.jm().format(this);
  }

  String get creationTime {
    if (this.isToday) {
      return "${this.time12}";
    } else {
      return "${DateFormat('MMM dd, yy').format(this)}";
    }
  }
}
