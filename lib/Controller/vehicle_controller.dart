import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/vehicle_model.dart';
import '../Model/visitor_vehicle.dart';

class VehicleController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot?> findVehicleByPlateNumber(String plateNumber) async {
    try {
      var docSnapshot = await _firebaseFirestore.collection('vehicle').doc(plateNumber).get();
      return docSnapshot.exists ? docSnapshot : null;
    } catch (e) {
      print("Error finding vehicle: $e");
      return null;
    }
  }

  Future<String?> fetchUserName() async {
    try {
      // Get the current user
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch the user document from Firestore using email as the identifier
        var docSnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).get();

        // Check if the document exists
        if (docSnapshot.docs.isNotEmpty) {
          // Extract user data from the first document in the query result
          Map<String, dynamic> data = docSnapshot.docs.first.data() as Map<String, dynamic>;

          // Return the name field, or null if it doesn't exist
          return data['name'] as String?;
        } else {
          print("Document does not exist");
          return null;
        }
      } else {
        // No user is logged in
        print("No user logged in");
        return null;
      }
    } catch (e) {
      // Handle errors (e.g., network issues, permission denied)
      print("Error fetching user name: $e");
      return null;
    }
  }

  Future<void> addOrUpdateVehicle(VehicleModel vehicle) async {
    try {
      await _firebaseFirestore.collection('vehicle').doc(vehicle.plateNumber).set({
        'name': vehicle.ownerName,
        'platenumber': vehicle.plateNumber,
        'typeofvehicle': vehicle.vehicleType,
      });
    } catch (e) {
      print("Error adding/updating vehicle: $e");
    }
  }



  Future<List<VehicleModel>> getUserVehicles() async {
    try {
      // Fetch the user name
      String? userName = await fetchUserName();

      if (userName != null) {
        // Fetch vehicles associated with the user's name
        var querySnapshot = await FirebaseFirestore.instance.collection('vehicle')
            .where('name', isEqualTo: userName)
            .get();

        // Check if any documents exist
        if (querySnapshot.docs.isNotEmpty) {
          // Map the documents to a list of VehicleModel objects
          List<VehicleModel> userVehicles = querySnapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return VehicleModel(
              ownerName: data['name'] as String,
              plateNumber: data['platenumber'] as String,
              vehicleType: data['typeofvehicle'] as String,
            );
          }).toList();

          return userVehicles;
        } else {
          print("No vehicles found for the user");
          return [];
        }
      } else {
        // Handle the case where user name is null
        print("User name is null");
        return [];
      }
    } catch (e) {
      // Handle errors (e.g., network issues, permission denied)
      print("Error fetching user vehicles: $e");
      return [];
    }
  }


}

