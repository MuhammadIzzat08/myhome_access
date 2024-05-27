import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../Model/user.dart';

class AdminController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getAllUsers() async {
    try {
      final userDocs = await _firestore.collection("users").get();
      return userDocs.docs.map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Error fetching users: $e");
    }
  }

  Future<void> deleteUser(String email) async {
    try {
      // Delete from Firestore
      await _firestore.collection("users").doc(email).delete();

      // Delete from Firebase Authentication
      final response = await http.post(
        Uri.parse('https://us-central1-myhomeaccess-365ff.cloudfunctions.net/deleteUser'), // Replace with your Cloud Function URL
        body: {'email': email},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete user from auth: ${response.body}');
      }
    } catch (e) {
      throw Exception("Error deleting user: $e");
    }
  }
}

