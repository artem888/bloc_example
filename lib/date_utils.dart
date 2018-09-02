import 'package:intl/intl.dart';

class DateUtils {
  static String formattedDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(date);
  }
}