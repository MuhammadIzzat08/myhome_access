import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/user.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore.collection("users").doc(user.email).set(user.toMap());
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.email).update(user.toMap());
    } catch (e) {
      throw Exception("Error updating user data: $e");
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final userDoc = await _firestore.collection("users").doc(email).get();
      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error fetching user data:$e");
    }
    }


}

