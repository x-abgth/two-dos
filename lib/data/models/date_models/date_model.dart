// import 'package:intl/intl.dart';

// class DateModel {
//   static String dateInRelative(String dateString, {bool numericDates = true}) {
//     print('************DateSring is: $dateString ******************');
//     DateTime notificationDate =
//         DateFormat("dd-MM-yyyy h:mma").parse(dateString);
//     final date2 = DateTime.now();
//     final difference = date2.difference(notificationDate) * -1;
//     print("---------------------------------------------");
//     print("Date difference = $difference");
//     print("Date difference in days = ${difference.inDays}");
//     print("Date difference in hours = ${difference.inHours}");
//     print("Date difference in minutes = ${difference.inMinutes}");
//     print("Date difference in seconds = ${difference.inSeconds}");
//     print("Date difference in negative = ${difference.isNegative}");

//     if (difference.inDays >= 365) {
//       return "in ${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? "year" : "years"}";
//     } else if (difference.inDays >= 30) {
//       return "in ${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? "month" : "months"}";
//     } else if (difference.inDays >= 14) {
//       return 'in ${(difference.inDays / 7).floor()} weeks';
//     } else if ((difference.inDays) >= 2) {
//       return 'in ${(difference.inDays)} days';
//     } else if (difference.inHours > 1) {
//       return 'in ${difference.inHours} hours';
//     } else if (difference.inMinutes > 5) {
//       return 'in a few mins';
//     } else if (difference.inSeconds > 1) {
//       return 'in ${difference.inSeconds} secs';
//     } else {
//       return "in ${difference.inSeconds} seconds";
//     }
//   }
// }
