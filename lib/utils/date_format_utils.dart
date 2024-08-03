import 'package:intl/intl.dart';

class DateFormatUtils {
  // Define commonly used date formats
  static final DateFormat _defaultFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _fullDateFormat = DateFormat('MMMM d, yyyy');
  static final DateFormat _shortDateFormat = DateFormat('MM/dd/yyyy');
  static final DateFormat _customFormat = DateFormat('dd-MM-yyyy');

  // Formats the date to 'yyyy-MM-dd'
  static String formatDefault(DateTime date) {
    return _defaultFormat.format(date);
  }

  // Formats the date to 'MMMM d, yyyy'
  static String formatFull(DateTime date) {
    return _fullDateFormat.format(date);
  }

  // Formats the date to 'MM/dd/yyyy'
  static String formatShort(DateTime date) {
    return _shortDateFormat.format(date);
  }

  // Formats the date to 'dd-MM-yyyy'
  static String formatCustom(DateTime date) {
    return _customFormat.format(date);
  }
}
