import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/emergency_alert.dart';

class EmergencyController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*Future<void> sendEmergencyAlert(EmergencyAlert alert) async {
    await _firestore.collection('emergency_alerts').add({
      'type': alert.type,
      'message': alert.message,
      'imageUrl': alert.imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }*/
  Future<void> sendEmergencyAlert(EmergencyAlert alert) async {
    try {
      await _firestore.collection('emergency_alerts').add(alert.toMap());
    } catch (e) {
      print('Error sending emergency alert:$e');
    }
    }

  Future<List<EmergencyAlert1>> getAllEmergencyAlerts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('emergency_alerts').get();

    return querySnapshot.docs.map((doc) => EmergencyAlert1.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
  }


/*Future<List<EmergencyAlert>> getAllEmergencyAlerts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('emergency_alerts').get();

    // Convert each document snapshot to an EmergencyAlert1 object
    return querySnapshot.docs.map((doc) => EmergencyAlert.fromMap(doc.data() as Map<String, dynamic>)).toList();*/
 // }
}


/*class EmergencyAlert {
  String? id; // Made nullable
  String type;
  String message;
  String? imageUrl; // Made nullable
  DateTime? timestamp; // Made nullable
  EmergencyAlert({this.id, required this.type, required this.message, this.imageUrl, this.timestamp});
}*/


