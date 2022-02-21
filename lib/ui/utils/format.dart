import 'package:intl/intl.dart';

String formatDate(DateTime date, {bool hour = true}) {
  return hour
      ? DateFormat(null, 'en_US').format(date)
      : DateFormat.yMMMMd('en_US').format(date);
}

String formatCompactDate(DateTime date) {
  return '${DateFormat.MMMd('en_US').format(date)} ${DateFormat.Hms('en_US').format(date)}'
      .trim();
}
