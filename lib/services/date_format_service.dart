import 'package:intl/intl.dart';

class DateFormatService {
  DateFormatService();

  String formatTime(DateTime dateTime) {
    return DateFormat.Hms().format(dateTime);
  }
}
