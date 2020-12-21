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

  if((compareTime.millisecondsSinceEpoch -inputTime.millisecondsSinceEpoch).abs()<=1000){
    return "00:00";
  }


  if (compareTime.isBefore(inputTime)) {
    ///今天
    return DateFormat("HH:mm").format(inputTime);
  }
  compareTime.add(Duration(days: -1));

  if ((compareTime.millisecondsSinceEpoch -inputTime.millisecondsSinceEpoch).abs()<1000*60*60*24) {
    ///昨天
    return "昨天";
  } else {
    compareTime = DateTime(year, DateTime.january, 1);
    if (compareTime.isAfter(inputTime)) {
      return DateFormat('yyyy年MM月dd日').format(inputTime);
    } else {
      return DateFormat('MM月dd日').format(inputTime);

    }
  }
}


