import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateFormatUtil {

  static String getAbreviatedMonthFromDate(Timestamp timestamp){
    return new DateFormat("MMM").format(timestamp.toDate());
  }

  static String getDayFromDate(Timestamp timestamp){
    return new DateFormat("d").format(timestamp.toDate());
  }

  static String getTimeFromDate(Timestamp timestamp){
    return new DateFormat("jm").format(timestamp.toDate());
  }

  static String getFullDateTimeForDisplayFromDate(Timestamp timestamp){
    return new DateFormat.yMMMMd('en_US').add_jm().format(timestamp.toDate());
  }
}