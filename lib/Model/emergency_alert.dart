import 'package:cloud_firestore/cloud_firestore.dart';


class EmergencyAlert {
  String? id;
  String type;
  String message;
  String? imageUrl; // Changed from Uint8List? imageBytes
  DateTime timestamp;
  String userEmail;
  String userName;
  String userAddress;

  EmergencyAlert({
    this.id,
    required this.type,
    required this.message,
    this.imageUrl, // Changed from this.imageBytes
    required this.timestamp,
    required this.userEmail,
    required this.userName,
    required this.userAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'message': message,
      'imageUrl': imageUrl, // Changed from imageBytes
      'timestamp': timestamp.toUtc().toIso8601String(),
      'userEmail': userEmail,
      'userName': userName,
      'userAddress': userAddress,
    };
  }

  factory EmergencyAlert.fromMap(Map<String, dynamic> map) {
    return EmergencyAlert(
      id: map['id'],
      type: map['type'],
      message: map['message'],
      imageUrl: map['imageUrl'], // Changed from imageBytes
      timestamp: DateTime.parse(map['timestamp']).toLocal(),
      userEmail: map['userEmail'],
      userName: map['userName'],
      userAddress: map['userAddress'],
    );
  }
}


class EmergencyAlert1 {
  String? id;
  String type;
  String message;
  String? imageUrl; // Changed from Uint8List? imageBytes
  DateTime timestamp;
  String userEmail;
  String userName;
  String userAddress;

  EmergencyAlert1({
    this.id,
    required this.type,
    required this.message,
    this.imageUrl, // Changed from this.imageBytes
    required this.timestamp,
    required this.userEmail,
    required this.userName,
    required this.userAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'message': message,
      'imageUrl': imageUrl, // Changed from imageBytes
      'timestamp': timestamp.toUtc().toIso8601String(),
      'userEmail': userEmail,
      'userName': userName,
      'userAddress': userAddress,
    };
  }

  factory EmergencyAlert1.fromFirestore(Map<String, dynamic> map) {
    return EmergencyAlert1(
      id: map['id'],
      type: map['type'],
      message: map['message'],
      imageUrl: map['imageUrl'], // Changed from imageBytes
      timestamp: DateTime.parse(map['timestamp']).toLocal(),
      userEmail: map['userEmail'],
      userName: map['userName'],
      userAddress: map['userAddress'],
    );
  }
}


