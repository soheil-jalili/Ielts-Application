import 'package:intl/intl.dart';

extension StringFormatter on String {
  String formatWithCommas() {
    final number = num.tryParse(this) ?? 0;

    var formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(number);
  }
}
