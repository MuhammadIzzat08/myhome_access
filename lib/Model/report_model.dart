import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getReportForDay(int year, int month, int day) async {
    String selectedDate = DateTime(year, month, day).toString();

    QuerySnapshot querySnapshot = await _firestore
        .collection('patrolSchedule')
        .where('day', isEqualTo: selectedDate)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  /*Future<List<Map<String, dynamic>>> getReportForMonth(int year, int month) async {
    DateTime startOfMonth = DateTime(year, month, 1);
    DateTime endOfMonth = DateTime(year, month + 1, 1).subtract(Duration(days: 1));

    QuerySnapshot querySnapshot = await _firestore
        .collection('patrolSchedule')
        .where('day', isGreaterThanOrEqualTo: startOfMonth.toString())
        .where('day', isLessThanOrEqualTo: endOfMonth.toString())
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<Map<String, dynamic>>> getReportForYear(int year) async {
    DateTime startOfYear = DateTime(year, 1, 1);
    DateTime endOfYear = DateTime(year + 1, 1, 1).subtract(Duration(days: 1));

    QuerySnapshot querySnapshot = await _firestore
        .collection('patrolSchedule')
        .where('day', isGreaterThanOrEqualTo: startOfYear.toString())
        .where('day', isLessThanOrEqualTo: endOfYear.toString())
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }*/

  Future<List<Map<String, dynamic>>> getReportForSelectedDate(String selectedDate) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('patrolSchedule')
        .where('day', isEqualTo: selectedDate)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    }
}
