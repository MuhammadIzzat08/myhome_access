import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryLogsItem {
  String? id; // Made non-nullable
  String type;
  String userName;
  String message;
  String? imageUrl;
  DateTime? timestamp;
  DateTime? accessStartTime;
  DateTime? accessEndTime;
  String? plateNumber;
  String? status;
  String? typeOfAccess;
  String? vehicleType;
  String? visitorName;

  HistoryLogsItem({
    this.id,
    required this.type,
    required this.userName,
    required this.message,
    this.imageUrl,
    this.timestamp,
    this.accessStartTime,
    this.accessEndTime,
    this.plateNumber,
    this.status,
    this.typeOfAccess,
    this.vehicleType,
    this.visitorName,
  });

  factory HistoryLogsItem.fromMap(Map<String, dynamic> map, String id) {
    return HistoryLogsItem(
      id: id,//map['id'] ?? '', // Ensure 'id' is non-nullable
      type: map['type'] ?? '',
      userName: map['userName'] ?? '',
      message: map['message'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      timestamp: map['timestamp']?.toDate(),
      accessStartTime: map['accessStartTime']?.toDate(),
      accessEndTime: map['accessEndTime']?.toDate(),
      plateNumber: map['plateNumber'] ?? '',
      status: map['status'] ?? '',
      typeOfAccess: map['typeOfAccess'] ?? '',
      vehicleType: map['vehicleType'] ?? '',
      visitorName: map['visitorName'] ?? '',
    );
  }
}



/*
class HistoryLogsModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<HistoryLogsItem>> getHistoryLogsStream2(String collection) {
    return _firestore.collection(collection).snapshots().map(
          (snapshot) => snapshot.docs
          .map(
            (doc) => HistoryLogsItem.fromMap({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        }),
      )
          .toList(),
    );
  }

  Stream<List<HistoryLogsItem>> getHistoryLogsStream(String collection, String userEmail) {
    return _firestore.collection(collection)
        .where('email', isEqualTo: userEmail) // Assuming you have a field named 'userEmail' in your visitor documents
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
          .map(
            (doc) => HistoryLogsItem.fromMap({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        }),
      )
          .toList(),
    );
  }
*/

//}
