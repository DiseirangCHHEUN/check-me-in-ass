import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
  }
}
