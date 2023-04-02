import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Helper {
  static String formatDate(DateTime dateTime) {
    initializeDateFormatting("id");
    return DateFormat.yMMMMd("id").format(dateTime);
  }
}
