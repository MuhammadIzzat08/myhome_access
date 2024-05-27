import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/history_logs.dart';

class HistoryLogsController {
  //final HistoryLogsModel _model = HistoryLogsModel();

 /* Stream<List<HistoryLogsItem>> getEmergencyLogsStream() {
    return _model.getHistoryLogsStream2('emergency_alerts');
  }*/
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<HistoryLogsItem>> getEmergency() {
    return _firestore
        .collection('emergency_alerts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        // Check if 'imageBytes' field exists and is not null
        /*if (doc.data()?['imageBytes'] != null) {
          return HistoryLogsItem.fromMap(
            doc.data()..['imageBytes'] = base64Decode(doc.data()?['imageBytes']),
            doc.id,
          );
        } else {*/
          return HistoryLogsItem.fromMap(doc.data(), doc.id);
        //}
      }).toList();
    });
  }


  /*Stream<List<HistoryLogsItem>> getVisitorLogsStream() {
    return _model.getHistoryLogsStream('visitor');
  }*/

 /* Stream<List<HistoryLogsItem>> getVisitorLogsStream(String userEmail) {
    return _model.getHistoryLogsStream('visitor', userEmail);
  }*/

  Stream<List<HistoryLogsItem>> getVisitorLogs() {
    return FirebaseFirestore.instance
        .collection('visitor')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        // Here, you can check if any specific fields need decoding or any other modifications
        // For now, I'm directly mapping the document data to the HistoryLogsItem object.
        return HistoryLogsItem.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }


  Future<String?> fetchUserName() async {
    try {
      // Get the current user
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch the user document from Firestore using email as the identifier
        var docSnapshot = await FirebaseFirestore.instance.collection('users')
            .where('email', isEqualTo: user.email)
            .get();

        // Check if the document exists
        if (docSnapshot.docs.isNotEmpty) {
          // Extract user data from the first document in the query result
          Map<String, dynamic> data = docSnapshot.docs.first.data() as Map<
              String,
              dynamic>;

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

 /* Future<String?> fetchUserNameFromEmail(String email) async {
    try {
      var docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (docSnapshot.docs.isNotEmpty) {
        return docSnapshot.docs.first.data()['name'];
      } else {
        return null; // Handle case where no user with the email is found
      }
    } catch (e) {
      print("Error fetching user name: $e");
      return null;
    }
  }
*/
}