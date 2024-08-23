import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
// <<<<<<< main
  String getHour() {
    // Example Timestamp from Firestore
    Timestamp timestamp = Timestamp.now();
    // Convert Timestamp to DateTime
    DateTime dateTime = timestamp.toDate();
    // Extract the hour
    int hour = dateTime.hour;
    int minutes = dateTime.minute;
    int second = dateTime.second;
    String datetime = "${hour}:${minutes}:${second}";
    return datetime;
// =======
//   String checkIn = "--/--";
//   String checkOut = "--/--";
//   @override
//   void onInit() {
//     getRecord();
//     super.onInit();
//   }

//   void getRecord() async {
//     try {
//       DocumentSnapshot snap2 = await FirebaseFirestore.instance
//           .collection('attendance')
//           .doc(
//             DateFormat('dd MMMM yyyy').format(DateTime.now()),
//           )
//           .get();
//       checkIn = snap2["checkIn"];
//       checkOut = snap2["checkOut"];
//       update();
//     } catch (e) {
//       checkIn = "--/--";
//       checkOut = "--/--";
//       update();
//     }
// >>>>>>> master
  }
}
