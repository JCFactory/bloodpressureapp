import 'package:intl/intl.dart';

class DateSingleton {
  static final DateSingleton _instance = DateSingleton._internal();
  factory DateSingleton() => _instance;

  // private Constructor
  DateSingleton._internal() {
    DateFormat('dd.MM.yyyy').format(DateTime.now());
    // give variables values
    // init things inside this
  }
}
