import 'package:intl/intl.dart';

class DateFormatService {
  DateFormatService();

  String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }
}
