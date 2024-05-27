/*import 'package:cloud_firestore/cloud_firestore.dart';

class VisitorVehicle {
  String ownerName;
  String plateNumber;
  DateTime accessStartTime;
  DateTime accessEndTime;
  String visitorName;
  String typeOfAccess;
  String vehicleType;
  String status;
  String userId;
  String accessToken;
  String visitorEmail;// Add visitor email field
  String ownerEmail;


  VisitorVehicle({
    required this.ownerName,
    required this.plateNumber,
    required this.accessStartTime,
    required this.accessEndTime,
    required this.visitorName,
    required this.typeOfAccess,
    required this.vehicleType,
    this.status = 'Access Granted',
    required this.userId,
    required this.accessToken,
    required this.visitorEmail,  // Initialize visitor email
    required this.ownerEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'OwnerName': ownerName,
      'plateNumber': plateNumber,
      'accessStartTime': Timestamp.fromDate(accessStartTime),
      'accessEndTime': Timestamp.fromDate(accessEndTime),
      'visitorName': visitorName,
      'typeOfAccess': typeOfAccess,
      'vehicleType': vehicleType,
      'status': status,
      'userId': userId,
      'accessToken': accessToken,
      'visitorEmail': visitorEmail,// Map visitor email
      'ownerEmail': ownerEmail,
    };
  }
  bool get isAccessExpired => DateTime.now().isAfter(accessEndTime);

  void updateStatus() {
    if (isAccessExpired) {
      status = 'Access Denied';
    }
  }
  static VisitorVehicle fromFirestore(Map<String, dynamic> firestoreData) {
    return VisitorVehicle(
      ownerName: firestoreData['OwnerName']??'' ,
      plateNumber: firestoreData['plateNumber'],
        accessStartTime: (firestoreData['accessStartTime'] as Timestamp).toDate(),
        accessEndTime: (firestoreData['accessEndTime'] as Timestamp).toDate(),
        visitorName: firestoreData['visitorName'],
        typeOfAccess: firestoreData['typeOfAccess'],
        vehicleType: firestoreData['vehicleType'],
        status: firestoreData['status'],
        userId: firestoreData['userId'],
        accessToken: firestoreData['accessToken'],
        visitorEmail: firestoreData['visitorEmail'],  // Extract visitor email
        ownerEmail: firestoreData['ownerEmail']??'',  // Extract owner's email
        );
    }
}

class MonthData {
  final String month;
  final int visitors;

  MonthData(this.month, this.visitors);
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class VisitorVehicle {
  String ownerName;
  String plateNumber;
  DateTime accessStartTime;
  DateTime accessEndTime;
  String visitorName;
  String typeOfAccess;
  String vehicleType;
  String status;
  String userId;
  String accessToken;
  String visitorEmail;
  bool fined;
  String ownerEmail;

  VisitorVehicle({
    required this.ownerName,
    required this.plateNumber,
    required this.accessStartTime,
    required this.accessEndTime,
    required this.visitorName,
    required this.typeOfAccess,
    required this.vehicleType,
    this.status = 'Access Granted',
    required this.userId,
    required this.accessToken,
    required this.visitorEmail,
    this.fined = false,
    required this.ownerEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'OwnerName': ownerName,
      'plateNumber': plateNumber,
      'accessStartTime': _formatDateTime(accessStartTime),
      'accessEndTime': _formatDateTime(accessEndTime),
      'visitorName': visitorName,
      'typeOfAccess': typeOfAccess,
      'vehicleType': vehicleType,
      'status': status,
      'userId': userId,
      'accessToken': accessToken,
      'visitorEmail': visitorEmail,
      'fined': fined,
      'ownerEmail': ownerEmail,
    };
  }


  static VisitorVehicle fromFirestore(Map<String, dynamic> firestoreData) {
    return VisitorVehicle(
      ownerName: firestoreData['OwnerName']??'' ,
      plateNumber: firestoreData['plateNumber'],
      accessStartTime: _parseKualaLumpurTime(firestoreData['accessStartTime']),
      accessEndTime: _parseKualaLumpurTime(firestoreData['accessEndTime']),
      visitorName: firestoreData['visitorName'],
      typeOfAccess: firestoreData['typeOfAccess'],
      vehicleType: firestoreData['vehicleType'],
      status: firestoreData['status'],
      userId: firestoreData['userId'],
      accessToken: firestoreData['accessToken'],
      visitorEmail: firestoreData['visitorEmail'],
      fined: firestoreData.containsKey('fined') ? firestoreData['fined'] : false,
      ownerEmail: firestoreData['ownerEmail']??'',  // Extract owner's email
    );
  }

  bool get isAccessExpired => DateTime.now().isAfter(accessEndTime);

  void updateStatus() {
    if (isAccessExpired) {
      status = 'Access Denied';
    }
  }

  // Helper function to format DateTime to Kuala Lumpur time
  String _formatDateTime(DateTime dateTime) {
    final kualaLumpurTime = dateTime.toUtc().add(Duration(hours: 8)); // Convert to UTC+8 time
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss').format(kualaLumpurTime);
    return formatter;
  }

  // Helper function to parse Kuala Lumpur time back to DateTime
  static DateTime _parseKualaLumpurTime(dynamic kualaLumpurTime) {
    if (kualaLumpurTime is Timestamp) {
      return (kualaLumpurTime as Timestamp).toDate().toUtc().subtract(Duration(hours: 8));
    } else if (kualaLumpurTime is String) {
      return DateFormat('yyyy-MM-dd HH:mm:ss').parse(kualaLumpurTime).toUtc().subtract(Duration(hours: 8));
    }
    throw Exception('Invalid Kuala Lumpur timeformat');
    }


}

class MonthData {
  final String month;
  final int visitors;

  MonthData(this.month, this.visitors);
}