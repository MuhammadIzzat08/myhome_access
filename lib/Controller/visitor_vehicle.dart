/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../Model/visitor_vehicle.dart'; // Adjust the import path as necessary
import 'package:googleapis/gmail/v1.dart' as gmail;
class VisitorVehicleController {
  final CollectionReference _visitorsCollection = FirebaseFirestore.instance.collection('visitor');

  Future<String> registerVehicle(String ownerName, String plateNumber, DateTime startTime, DateTime endTime, String visitorName, String typeOfAccess, String vehicleType, String userId, String visitorEmail) async {
    var existingVehicle = await _visitorsCollection.doc(plateNumber).get();
    if (existingVehicle.exists) {
      return "Plate Number already registered";
    }

    var accessToken = Uuid().v4();
    var vehicle = VisitorVehicle(
      ownerName: ownerName,
      plateNumber: plateNumber,
      accessStartTime: startTime,
      accessEndTime: endTime,
      visitorName: visitorName,
      typeOfAccess: typeOfAccess,
      vehicleType: vehicleType,
      userId: userId,
      accessToken: accessToken,
      visitorEmail: visitorEmail,
      ownerEmail:'',
    );

    await _visitorsCollection.doc(plateNumber).set({
      'OwnerName': vehicle.ownerName,
      'plateNumber': vehicle.plateNumber,
      'accessStartTime': vehicle.accessStartTime,
      'accessEndTime': vehicle.accessEndTime,
      'visitorName': vehicle.visitorName,
      'typeOfAccess': vehicle.typeOfAccess,
      'vehicleType': vehicle.vehicleType,
      'status': vehicle.status,
      'userId': vehicle.userId,
      'accessToken': vehicle.accessToken,
      'visitorEmail': vehicle.visitorEmail,
    });

    return "Vehicle registered and access token sent to visitor's email.";
  }

  Future<List<VisitorVehicle>> getRegisteredVehicles() async {
    var querySnapshot = await _visitorsCollection.get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> updateVehicleStatuses() async {
    var querySnapshot = await _visitorsCollection.get();
    for (var doc in querySnapshot.docs) {
      var vehicle = VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>);
      if (vehicle.isAccessExpired) {
        await doc.reference.update({'status': 'Access Denied'});
      }
    }
  }

  Future<void> applyFine(String plateNumber) async {
    try {
      await _visitorsCollection.doc(plateNumber).update({'fined': true});
    } catch (e) {
      print("Error applying fine: $e");
    }
  }

  Future<VisitorVehicle?> getVehicleDetails(String plateNumber) async {
    var document = await _visitorsCollection.doc(plateNumber).get();
    if (document.exists) {
      return VisitorVehicle.fromFirestore(document.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<List<VisitorVehicle>> getRegisteredVehiclesByUser() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return [];
    }

    var querySnapshot = await _visitorsCollection.where('userId', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<bool> validateToken(String token) async {
    try {
      var document = await _visitorsCollection.where('accessToken', isEqualTo: token).limit(1).get();
      if (document.docs.isEmpty) {
        return false;
      }
      var vehicle = VisitorVehicle.fromFirestore(document.docs.first.data() as Map<String, dynamic>);
      return vehicle.status == 'Access Granted';
    } catch (e) {
      print("Error validating token: $e");
      return false;
    }
    }


  Future<List<VisitorVehicle>> getVisitorsByOwnerName(String ownerName) async {
    var querySnapshot =
    await _visitorsCollection.where('OwnerName', isEqualTo: ownerName).get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<String?> getUserNameByEmail(String userEmail) async {
    String? userName;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        userName = querySnapshot.docs.first['name'];
      }
    });
    return userName;
  }


//get yearly data of visitor
  Future<List<int>> getYearlyVisitorCount() async {
    var querySnapshot = await _visitorsCollection.get();
    Map<int, int> yearlyData = {};

    for (var doc in querySnapshot.docs) {
      var vehicle = VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>);
      int year = vehicle.accessStartTime.year;

      if (yearlyData.containsKey(year)) {
        yearlyData[year] = yearlyData[year]! + 1;
      } else {
        yearlyData[year] = 1;
      }
    }

    return yearlyData.values.toList();
  }


  //fetch monthly data number of visitor
  Future<List<int>> fetchMonthlyVisitorDataForYear(int year) async {
    List<int> monthlyData = List.filled(12, 0); // Initialize a list with 12 zeros for each month

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('visitor') // Adjust collection name if it's different
          .get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Timestamp? accessTime = doc['accessStartTime'] as Timestamp?;
        if (accessTime != null) {
          DateTime dateTime = accessTime.toDate();
          if (dateTime.year == year) {
            int month = dateTime.month;
            // Assuming month ranges from 1 (January) to 12 (December), subtract 1 to fit the index.
            // For example, January will be 0, February will be 1, and so on.
            monthlyData[month - 1] += 1; // Increment the count for the respective month
          }
        }
      }
    } catch (e) {
      print("Error fetching monthly data: $e");
    }

    return monthlyData;
  }

// admin get payment
  Stream<QuerySnapshot> getPaymentTransactions() {
    return FirebaseFirestore.instance
        .collection('visitor')
        .where('fined', isEqualTo: false)
        .snapshots();
  }


//update details visitor
  Future<void> updateVisitorDetails(VisitorVehicle visitor) async {
    try {
      await _visitorsCollection.doc(visitor.plateNumber).update({
        'visitorName': visitor.visitorName,
        'plateNumber': visitor.plateNumber,
      });
    } catch (e) {
      print("Error updating visitor details: $e");
    }
  }


  //visitor login check
  Future<bool> checkVisitorStatus(String accessToken) async {
    try {
      var querySnapshot = await _visitorsCollection.where('accessToken', isEqualTo: accessToken).get();

      if (querySnapshot.docs.isNotEmpty) {
        var vehicle = VisitorVehicle.fromFirestore(querySnapshot.docs.first.data() as Map<String, dynamic>);

        if (vehicle.status == 'Access Granted') {
          return true;
        } else if (vehicle.status == 'Access Denied' && vehicle.fined == true) {
          return false;
        } else {
          // Handle other status conditions if needed
          return false;
        }
      } else {
        // Handle the case where no document matches the accessToken
        return false;
      }
    } catch (e) {
      print("Error checking visitor status: $e");
      return false;
    }
  }




}
*/

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../Model/visitor_vehicle.dart'; // Adjust the import path as necessary
import 'package:googleapis/gmail/v1.dart' as gmail;
import 'package:http/http.dart' as http;

class VisitorVehicleController {
  final CollectionReference _visitorsCollection =
  FirebaseFirestore.instance.collection('visitor');

  //Test add here


  Future<String> registerVehicle(
      String ownerName,String plateNumber, DateTime startTime, DateTime endTime,
      String visitorName, String typeOfAccess, String vehicleType,
      String userId, String visitorEmail) async {
    var existingVehicle = await _visitorsCollection.doc(plateNumber).get();
    if (existingVehicle.exists) {
      return "Plate Number already registered";
    }

    var accessToken = Uuid().v4();
    var vehicle = VisitorVehicle(
      ownerName: ownerName,
      plateNumber: plateNumber,
      accessStartTime: startTime.toUtc(),//.add(Duration(hours:-8)), // Convert to UTC and then subtract 8 hours for UTC+8 (Kuala Lumpur time)
      accessEndTime: endTime.toUtc(),//.add(Duration(hours: 8)), // Convert to UTC and then subtract 8 hours for UTC+8 (Kuala Lumpur time)
      visitorName: visitorName,
      typeOfAccess: typeOfAccess,
      vehicleType: vehicleType,
      userId: userId,
      accessToken: accessToken,
      visitorEmail: visitorEmail,
      ownerEmail: '',

    );

    await _visitorsCollection.doc(plateNumber).set({
      'OwnerName': vehicle.ownerName,
      'plateNumber': vehicle.plateNumber,
      'accessStartTime': vehicle.accessStartTime,
      'accessEndTime': vehicle.accessEndTime,
      'visitorName': vehicle.visitorName,
      'typeOfAccess': vehicle.typeOfAccess,
      'vehicleType': vehicle.vehicleType,
      'status': vehicle.status,
      'userId': vehicle.userId,
      'accessToken': vehicle.accessToken,
      'visitorEmail': vehicle.visitorEmail,
    });

    return "Vehicle registered and access token sent to visitor's email.";
  }

  //list registered vehicle
  Future<List<VisitorVehicle>> getRegisteredVehicles() async {
    var querySnapshot = await _visitorsCollection.get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(
        doc.data() as Map<String, dynamic>)).toList();
  }


//update vehicle
  Future<void> updateVehicleStatuses() async {
    var querySnapshot = await _visitorsCollection.get();
    for (var doc in querySnapshot.docs) {
      var vehicle = VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>);
      if (vehicle.isAccessExpired) {
        await doc.reference.update({'status': 'Access Denied'});
      }
    }
  }


//apply fine
  Future<void> applyFine(String plateNumber, String visitorEmail) async {
    try {
      await _visitorsCollection.doc(plateNumber).update({'fined': true, 'visitorEmail': visitorEmail});
      // Cloud Function will handle the notification
    } catch (e) {
      print("Error applying fine: $e");
    }
  }

//list details vehicle
  Future<VisitorVehicle?> getVehicleDetails(String plateNumber) async {
    var document = await _visitorsCollection.doc(plateNumber).get();
    if (document.exists) {
      return VisitorVehicle.fromFirestore(document.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  //list registered visitor of the owner logged in

  Future<List<VisitorVehicle>> getRegisteredVehiclesByUser() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return [];
    }

    var querySnapshot = await _visitorsCollection.where('userId', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(
        doc.data() as Map<String, dynamic>)).toList();
  }

  Future<bool> validateToken(String token) async {
    try {
      var document =
      await _visitorsCollection.where('accessToken', isEqualTo: token).limit(1).get();
      if (document.docs.isEmpty) {
        print("Token not found in Firestore");
        return false;
      }

      var data = document.docs.first.data() as Map<String, dynamic>;

      if (!data.containsKey('status') || !data.containsKey('fined')) {
        var status = data['status'] as String;
        // Handle missing fields as needed, for example:
        print("Missing status or fined field in Firestore document");
        if (status == 'Access Granted'){
          return true;
        } else{
          return false;
        }

      }

      var status = data['status'] as String;
      var fined = data['fined'] as bool;

      // Consider using an enum for status values
      if  (status == 'Access Denied' && fined) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error validating token: $e");
      return false;
    }
  }
  //Test
  Future<String?> getVisitorEmail(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('https://your-cloud-function-url/getVisitorEmail?token=$accessToken'), // Replace with your Cloud Function URL
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final visitorEmail = data['email'] as String?;
        return visitorEmail;
      } else {
        // Handle errors or return null
        return null;
      }
    } catch (error) {
      // Handle network or other errors
      return null;
    }
  }

  //payment
  Stream<QuerySnapshot> getPaymentTransactions() {
    return FirebaseFirestore.instance
        .collection('visitor')
        .where('fined', isEqualTo: false)
        .snapshots();
    }

    //list visitor of the owner logged in

  Future<List<VisitorVehicle>> getVisitorsByOwnerName(String ownerName) async {
    var querySnapshot =
    await _visitorsCollection.where('OwnerName', isEqualTo: ownerName).get();
    return querySnapshot.docs.map((doc) => VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
  }

  //get username

  Future<String?> getUserNameByEmail(String userEmail) async {
    String? userName;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        userName = querySnapshot.docs.first['name'];
      }
    });
    return userName;
  }

  //update details visitor
  Future<void> updateVisitorDetails(VisitorVehicle visitor) async {
    try {
      await _visitorsCollection.doc(visitor.plateNumber).update({
        'visitorName': visitor.visitorName,
        'plateNumber': visitor.plateNumber,
      });
    } catch (e) {
      print("Error updating visitor details: $e");
    }
  }

  //get yearly data of visitor
  Future<List<int>> getYearlyVisitorCount() async {
    var querySnapshot = await _visitorsCollection.get();
    Map<int, int> yearlyData = {};

    for (var doc in querySnapshot.docs) {
      var vehicle = VisitorVehicle.fromFirestore(doc.data() as Map<String, dynamic>);
      int year = vehicle.accessStartTime.year;

      if (yearlyData.containsKey(year)) {
        yearlyData[year] = yearlyData[year]! + 1;
      } else {
        yearlyData[year] = 1;
      }
    }

    return yearlyData.values.toList();
  }

  Future<VisitorVehicle?> getVehicleByAccessToken(String accessToken) async {
    try {
      var document = await _visitorsCollection.where('accessToken', isEqualTo: accessToken).limit(1).get();

      if (document.docs.isNotEmpty) {
        return VisitorVehicle.fromFirestore(document.docs.first.data() as Map<String, dynamic>);
      } else {
        // Handle the case where no document matches the accessToken
        print("No vehicle found for the provided accessToken");
        return null;
      }
    } catch (e) {
      // Handle errors
      print('Error fetching vehicle data: $e');
      return null;
    }
  }
  //fetch monthly data number of visitor
  Future<List<int>> fetchMonthlyVisitorDataForYear(int year) async {
    List<int> monthlyData = List.filled(12, 0); // Initialize a list with 12 zeros for each month

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('visitor') // Adjust collection name if it's different
          .get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Timestamp? accessTime = doc['accessStartTime'] as Timestamp?;
        if (accessTime != null) {
          DateTime dateTime = accessTime.toDate();
          if (dateTime.year == year) {
            int month = dateTime.month;
            // Assuming month ranges from 1 (January) to 12 (December), subtract 1 to fit the index.
            // For example, January will be 0, February will be 1, and so on.
            monthlyData[month - 1] += 1; // Increment the count for the respective month
          }
        }
      }
    } catch (e) {
      print("Error fetching monthly data: $e");
    }

    return monthlyData;
  }

  //visitor login check
  Future<bool> checkVisitorStatus(String accessToken) async {
    try {
      var querySnapshot = await _visitorsCollection.where('accessToken',
          isEqualTo: accessToken).get();

      if (querySnapshot.docs.isNotEmpty) {
        var vehicle = VisitorVehicle.fromFirestore(
            querySnapshot.docs.first.data() as Map<String, dynamic>);

        if (vehicle.status == 'Access Granted') {
          return true;
        } else if (vehicle.status == 'Access Denied' && vehicle.fined == true) {
          return false;
        } else {
          // Handle other status conditions if needed
          return false;
        }
      } else {
        // Handle the case where no document matches the accessToken
        print("document is empty");
        return false;
      }
    } catch (e) {
      print("Error checking visitor status: $e");
      return false;
    }
  }





}
