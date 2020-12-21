import 'package:intl/intl.dart';




String timestampToChatTime(int timestamp) {
  if (timestamp == null || timestamp <= 0) {
    return "";
  }
  String timeStr = timestamp.toString();
  if (timeStr.length == 10) {
    timestamp = timestamp * 1000;
  }
  DateTime inputTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  DateTime compareTime = DateTime(year, month, day);
  if (compareTime.isBefore(inputTime)) {
    ///今天
    return DateFormat("hh:mm").format(inputTime);
  }
  compareTime.add(Duration(days: -1));
  if (compareTime.isBefore(inputTime)) {
    ///昨天
    return "昨天 " + DateFormat("hh:mm").format(inputTime);
  } else {
    compareTime = DateTime(year, DateTime.january, 1);
    if (compareTime.isBefore(inputTime)) {
      return DateFormat('MM月dd日 hh:mm').format(inputTime);
    } else {
      return DateFormat('yyyy年MM月dd日 hh:mm').format(inputTime);
    }
  }
}


